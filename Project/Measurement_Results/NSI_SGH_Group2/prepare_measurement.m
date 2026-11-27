%% Prepare NSI far-field measurement data (Ka-band SGH) -> .mat
% Reads all NSI_SGH_*f<MHz>n<idx>.txt files in this folder and writes
% NSI_SGH_Group2_FF.mat next to this script.
%
% Notes from readme.txt that are applied here:
%  - The amplitude columns ARE directivity in dB (lab email corrects the readme:
%    since the data is in dB, it is directivity). We build a field with
%    |E| = 10^(dB/20), so |E|^2 = directivity (linear).
%  - The Phi/Theta coordinate columns are swapped/transposed (lab email); they
%    are ignored and the grid is rebuilt from the header (see readNSI).
%  - AUT is vertically (y-) polarised -> Ludwig-3 co-pol reference phi0 = 90 deg.
%    That makes phi = 90 the E-plane and phi = 0 the H-plane.
%  - Far-field data for theta > 120 deg is a processing artefact -> set to NaN
%    (raw values are kept in meas.raw).
%  - Header "Maximum Gain" = directivity minus analytic waveguide losses.
%
% Output (variable "meas"):
%   meas.f        [Nf x 1]  frequency [Hz]
%   meas.phi      [Nphi x 1] deg, meas.theta [Nth x 1] deg
%   meas.Eth, meas.Eph       complex E-field, size [Nphi x Nth x Nf], NaN for theta > thetaMax
%   meas.Eco, meas.Ecx       Ludwig-3 co/cross-pol fields (same size)
%   meas.Dtot, meas.Dco, meas.Dcx   directivity in dB (same size)
%   meas.D0_hdr, meas.G0_hdr, meas.loss_dB   [Nf x 1] values from the file headers
%   meas.raw.Eth, meas.raw.Eph       unmasked fields (incl. theta > thetaMax)
%   S             flat cut table for compare_horns.m (same layout as readCuts):
%                 S.f [GHz], S.phi, S.theta in [-thetaMax, thetaMax], S.Q = [Dtot Dco Dcx] in dB
clear; clc;

%% ---- Configuration -------------------------------------------------------
cfg.dataDir  = fileparts(mfilename('fullpath'));
cfg.pattern  = 'NSI_SGH_*f*n*.txt';
cfg.outFile  = fullfile(cfg.dataDir, 'NSI_SGH_Group2_FF.mat');
cfg.phi0     = 90;     % co-pol reference [deg]: 90 = vertical (y) polarisation
cfg.thetaMax = 120;    % valid theta span of the near-field scan [deg]
cfg.cutPhi   = 0:179;  % phi cuts exported to S (theta<0 taken from phi+180)

%% ---- Read files ----------------------------------------------------------
d = dir(fullfile(cfg.dataDir, cfg.pattern));
if isempty(d), error('No files matching %s in %s', cfg.pattern, cfg.dataDir); end

for k = 1:numel(d)
    r(k) = readNSI(fullfile(d(k).folder, d(k).name)); %#ok<SAGROW>
    fprintf('%-34s f = %6.2f GHz  D0 = %.3f dB  G0 = %.3f dB\n', ...
            d(k).name, r(k).f/1e9, r(k).D0, r(k).G0);
end
[~, o] = sort([r.f]);  r = r(o);

phi   = r(1).phi;  theta = r(1).theta;
for k = 2:numel(r)
    if ~isequal(r(k).phi, phi) || ~isequal(r(k).theta, theta)
        error('Angular grid of %s differs from the first file', r(k).file);
    end
end

%% ---- Assemble -------------------------------------------------------------
Nf = numel(r);
meas.name     = 'Ka-band SGH (NSI, Group 2)';
meas.f        = [r.f].';
meas.phi      = phi;
meas.theta    = theta;
meas.thetaMax = cfg.thetaMax;
meas.phi0     = cfg.phi0;
meas.D0_hdr   = [r.D0].';
meas.G0_hdr   = [r.G0].';
meas.loss_dB  = meas.D0_hdr - meas.G0_hdr;
meas.files    = {r.file}.';

meas.raw.Eth = cat(3, r.Eth);
meas.raw.Eph = cat(3, r.Eph);

valid = theta.' <= cfg.thetaMax;                 % [1 x Nth]
mask  = repmat(double(valid), numel(phi), 1, Nf);
mask(mask == 0) = NaN;
meas.Eth = meas.raw.Eth .* mask;
meas.Eph = meas.raw.Eph .* mask;

% Ludwig-3 co/cross polarisation
P   = repmat(deg2rad(phi - cfg.phi0), 1, numel(theta), Nf);
meas.Eco = meas.Eth .* cos(P) - meas.Eph .* sin(P);
meas.Ecx = meas.Eth .* sin(P) + meas.Eph .* cos(P);

dB = @(E) 20*log10(abs(E));
meas.Dtot = 10*log10(abs(meas.Eth).^2 + abs(meas.Eph).^2);
meas.Dco  = dB(meas.Eco);
meas.Dcx  = dB(meas.Ecx);

%% ---- Sanity check: recomputed peak vs header ----------------------------
for k = 1:Nf
    pk = max(meas.Dtot(:,:,k), [], 'all');
    fprintf('f = %6.2f GHz: max Dtot = %.3f dB (header %.3f dB), max XPD on boresight = %.1f dB\n', ...
        meas.f(k)/1e9, pk, meas.D0_hdr(k), ...
        meas.Dco(1,1,k) - meas.Dcx(1,1,k));
end

%% ---- Flat cut table for compare_horns.m ----------------------------------
S = buildCuts(meas, cfg.cutPhi);

save(cfg.outFile, 'meas', 'S', 'cfg', '-v7.3');
fprintf('Saved %s\n', cfg.outFile);

%% ---- Quick-look plot: E- and H-plane co/cx --------------------------------
figure('Name','NSI SGH Group 2','Position',[100 100 1200 420]);
planes = {'H-plane (\phi = 0°)', 0; 'E-plane (\phi = 90°)', 90};
for p = 1:2
    ax = subplot(1,2,p); hold(ax,'on'); grid(ax,'on');
    for k = 1:Nf
        sel = abs(S.f - meas.f(k)/1e9) < 1e-9 & S.phi == planes{p,2};
        h = plot(ax, S.theta(sel), S.Q(sel,2), '-', 'LineWidth',1.3, ...
                 'DisplayName', sprintf('Co %.2f GHz', meas.f(k)/1e9));
        plot(ax, S.theta(sel), S.Q(sel,3), '--', 'Color', h.Color, ...
             'DisplayName', sprintf('Cx %.2f GHz', meas.f(k)/1e9));
    end
    xlim(ax, [-cfg.thetaMax cfg.thetaMax]);
    ylim(ax, max(meas.D0_hdr) + [-60 5]);
    xlabel(ax, '\theta [deg]'); ylabel(ax, 'Directivity [dBi]');
    title(ax, planes{p,1}); legend(ax, 'Location','southoutside','NumColumns',3);
end

%% =========================================================================
function r = readNSI(file)
    % Reads one NSI tabulated far-field file.
    txt = fileread(file);
    r.file = file;
    r.f  = 1e6 * str2double(regexp(txt, 'frequency\s*=\s*([\d.]+)\s*MHz', 'tokens','once'));
    r.D0 = str2double(regexp(txt, 'Maximum Directivity:\s*([-\d.eE+]+)', 'tokens','once'));
    r.G0 = str2double(regexp(txt, 'Maximum Gain:\s*([-\d.eE+]+)', 'tokens','once'));
    Nphi = str2double(regexp(txt, 'Phi points:\s*(\d+)', 'tokens','once'));
    Nth  = str2double(regexp(txt, 'The points:\s*(\d+)', 'tokens','once'));

    % numeric block starts after the column-header line that follows '--------'
    i0  = regexp(txt, '-{4,}[^\n]*\n[^\n]*\n', 'end', 'once');
    A   = sscanf(txt(i0+1:end), '%f');
    A   = reshape(A, 6, []).';
    if size(A,1) ~= Nphi*Nth
        error('%s: expected %d rows, got %d', file, Nphi*Nth, size(A,1));
    end
    % IMPORTANT (email from lab, Nov 2026): columns 1-2 (Phi/Theta) are swapped AND
    % transposed w.r.t. the data. The samples in columns 3-6 actually run with phi
    % fastest, theta slowest -> reshape(col, Nphi, Nth) gives [Nphi x Nth].
    % Columns 1-2 are therefore ignored; the grid is rebuilt from the header.
    phiLim = str2double(regexp(txt, 'Phi in:\s*\[([-\d.]+),\s*([-\d.]+)\]', 'tokens','once'));
    thLim  = str2double(regexp(txt, 'The in:\s*\[([-\d.]+),\s*([-\d.]+)\]', 'tokens','once'));
    r.phi   = linspace(phiLim(1), phiLim(2), Nphi).';
    r.theta = linspace(thLim(1),  thLim(2),  Nth).';
    g = @(c) reshape(A(:,c), Nphi, Nth);
    r.Eth = 10.^(g(3)/20) .* exp(1j*deg2rad(g(4)));
    r.Eph = 10.^(g(5)/20) .* exp(1j*deg2rad(g(6)));
end

function S = buildCuts(meas, cutPhi)
    % Full theta cuts in [-thetaMax, thetaMax]; theta<0 at phi comes from phi+180.
    % Note: for theta<0 the field components are taken from phi+180 as-is; the
    % magnitudes (|Eth|,|Eph|, co/cx in dB) are what matters for pattern cuts.
    th   = meas.theta(meas.theta <= meas.thetaMax);
    nTh  = numel(th);
    tAll = [-flipud(th(2:end)); th];
    S.f = []; S.phi = []; S.theta = []; S.Q = [];
    S.qnames = {'dB(DirTotal)','dB(DirCo)','dB(DirCx)'};
    for k = 1:numel(meas.f)
        for ph = cutPhi(:).'
            i1 = find(abs(meas.phi - ph) < 1e-6, 1);
            i2 = find(abs(meas.phi - mod(ph+180,360)) < 1e-6, 1);
            if isempty(i1) || isempty(i2), continue; end
            Q1 = [meas.Dtot(i1,1:nTh,k); meas.Dco(i1,1:nTh,k); meas.Dcx(i1,1:nTh,k)].';
            Q2 = [meas.Dtot(i2,1:nTh,k); meas.Dco(i2,1:nTh,k); meas.Dcx(i2,1:nTh,k)].';
            Q  = [flipud(Q2(2:end,:)); Q1];
            n  = numel(tAll);
            S.f     = [S.f;     repmat(meas.f(k)/1e9, n, 1)];
            S.phi   = [S.phi;   repmat(ph, n, 1)];
            S.theta = [S.theta; tAll];
            S.Q     = [S.Q;     Q];
        end
    end
end
