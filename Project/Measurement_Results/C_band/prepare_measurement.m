%% Prepare MVG far-field measurement data (C-band SGH, BL206) -> .mat
% Reads BL206_FF_Data_ETheta_EPhi.mat (MVG export, see MVG_read_plot.m) and
% writes C_band_FF.mat next to this script, same layout as the Ka-band
% NSI_SGH_Group2/prepare_measurement.m output.
%
% Notes on the data:
%  - Layers are Re/Im of E_theta and E_phi, normalised so that
%    |Eth|^2 + |Eph|^2 = directivity (linear): peak 17.1 dBi at 3.95 GHz.
%  - Grid: phi = 0:5:175 deg, theta = -180:1:180 deg (full cuts, theta<0 is
%    the other half of the cut), 9 frequencies 3.95:0.25:5.85 GHz.
%  - The AUT is horizontally (x-) polarised in the MVG coordinate system
%    (E_theta dominates at phi = 0) -> Ludwig-3 co-pol reference phi0 = 0 deg,
%    so phi = 0 is the E-plane and phi = 90 the H-plane.
%  - HFSS / compare_horns.m use phi = 90 as E-plane. To keep one convention,
%    the phi labels in the exported cut table S are shifted by cfg.phiShift
%    (= +90 deg): S.phi = 90 is the measured E-plane, S.phi = 0 the H-plane.
%    meas.* keeps the original MVG phi.
%
% Output (variable "meas"):
%   meas.f        [Nf x 1]  frequency [Hz]
%   meas.phi      [Nphi x 1] deg (MVG system), meas.theta [Nth x 1] deg
%   meas.Eth, meas.Eph       complex E-field, size [Nphi x Nth x Nf]
%   meas.Eco, meas.Ecx       Ludwig-3 co/cross-pol fields (same size)
%   meas.Dtot, meas.Dco, meas.Dcx   directivity in dB (same size)
%   meas.D0                  [Nf x 1] max of Dtot over the whole sphere [dBi]
%   S             flat cut table for compare_horns.m (same layout as readCuts):
%                 S.f [GHz], S.phi (shifted, see above), S.theta in [-180,180],
%                 S.Q = [Dtot Dco Dcx] in dB
clear; clc;

%% ---- Configuration -------------------------------------------------------
cfg.dataDir  = fileparts(mfilename('fullpath'));
cfg.inFile   = fullfile(cfg.dataDir, 'BL206_FF_Data_ETheta_EPhi.mat');
cfg.outFile  = fullfile(cfg.dataDir, 'C_band_FF.mat');
cfg.phi0     = 0;      % co-pol reference [deg]: 0 = horizontal (x) polarisation
cfg.phiShift = 90;     % added to phi in S so that the E-plane lands on phi = 90

%% ---- Read file -----------------------------------------------------------
L = load(cfg.inFile, 'data');  data = L.data;
ax = @(name) data.axes(strcmp({data.axes.name}, name)).data;
phi   = ax('Azimuth').'   * 180/pi;      % [Nphi x 1] deg
theta = ax('Elevation').' * 180/pi;      % [Nth  x 1] deg
f     = ax('Frequency').';               % [Nf   x 1] Hz
phi   = round(phi*1e6)/1e6;  theta = round(theta*1e6)/1e6;   % clean rad->deg round-off

lay = @(name) data.layers(strcmp({data.layers.name}, name)).data;
Eth = lay('ETheta Electric Field (Real Part)') + 1j*lay('ETheta Electric Field (Imaginary Part)');
Eph = lay('EPhi Electric Field (Real Part)')   + 1j*lay('EPhi Electric Field (Imaginary Part)');
if ~isequal(size(Eth), [numel(phi) numel(theta) numel(f)])
    error('Unexpected layer size %s', mat2str(size(Eth)));
end

%% ---- Assemble -------------------------------------------------------------
meas.name     = 'C-band SGH (MVG, BL206)';
meas.f        = f;
meas.phi      = phi;
meas.theta    = theta;
meas.phi0     = cfg.phi0;
meas.phiShift = cfg.phiShift;
meas.date     = data.meta.Measurement_date;
meas.Eth      = Eth;
meas.Eph      = Eph;

% Ludwig-3 co/cross polarisation
P = repmat(deg2rad(phi - cfg.phi0), 1, numel(theta), numel(f));
meas.Eco = Eth .* cos(P) - Eph .* sin(P);
meas.Ecx = Eth .* sin(P) + Eph .* cos(P);

dB = @(E) 20*log10(abs(E));
meas.Dtot = 10*log10(abs(Eth).^2 + abs(Eph).^2);
meas.Dco  = dB(meas.Eco);
meas.Dcx  = dB(meas.Ecx);
meas.D0   = squeeze(max(meas.Dtot, [], [1 2]));

%% ---- Sanity check ----------------------------------------------------------
i0 = find(abs(theta) < 1e-6, 1);
for k = 1:numel(f)
    fprintf('f = %5.2f GHz: D0 = %6.3f dBi, boresight XPD = %5.1f dB\n', ...
        f(k)/1e9, meas.D0(k), meas.Dco(1,i0,k) - meas.Dcx(1,i0,k));
end

%% ---- Flat cut table for compare_horns.m ----------------------------------
S = buildCuts(meas);

save(cfg.outFile, 'meas', 'S', 'cfg');
fprintf('Saved %s\n', cfg.outFile);

%% ---- Quick-look plot: E- and H-plane co/cx --------------------------------
figure('Name','MVG C-band SGH','Position',[100 100 1200 420]);
planes = {'E-plane', 90; 'H-plane', 0};          % S.phi convention (shifted)
fPlot  = f(1:4:end);                             % 3.95, 4.95, 5.85 GHz
for p = 1:2
    axh = subplot(1,2,p); hold(axh,'on'); grid(axh,'on');
    for k = 1:numel(fPlot)
        sel = abs(S.f - fPlot(k)/1e9) < 1e-9 & S.phi == planes{p,2};
        h = plot(axh, S.theta(sel), S.Q(sel,2), '-', 'LineWidth',1.3, ...
                 'DisplayName', sprintf('Co %.2f GHz', fPlot(k)/1e9));
        plot(axh, S.theta(sel), S.Q(sel,3), '--', 'Color', h.Color, ...
             'DisplayName', sprintf('Cx %.2f GHz', fPlot(k)/1e9));
    end
    xlim(axh, [-180 180]);  xticks(axh, -180:45:180);
    ylim(axh, max(meas.D0) + [-50 5]);
    xlabel(axh, '\theta [deg]'); ylabel(axh, 'Directivity [dBi]');
    title(axh, sprintf('%s (MVG \\phi = %g°)', planes{p,1}, ...
          mod(planes{p,2} - cfg.phiShift, 180)));
    legend(axh, 'Location','southoutside','NumColumns',3);
end

%% =========================================================================
function S = buildCuts(meas)
    % One full theta cut [-180,180] per phi, phi relabelled by meas.phiShift
    % (kept in [0,180) since theta covers both halves of each cut).
    nTh = numel(meas.theta);
    S.f = []; S.phi = []; S.theta = []; S.Q = [];
    S.qnames = {'dB(DirTotal)','dB(DirCo)','dB(DirCx)'};
    for k = 1:numel(meas.f)
        for i = 1:numel(meas.phi)
            phS = mod(meas.phi(i) + meas.phiShift, 360);
            th  = meas.theta;
            if phS >= 180                 % same cut seen from phi-180: mirror theta
                phS = phS - 180;  th = -th;
            end
            Q = [meas.Dtot(i,:,k); meas.Dco(i,:,k); meas.Dcx(i,:,k)].';
            [th, o] = sort(th);  Q = Q(o,:);
            S.f     = [S.f;     repmat(meas.f(k)/1e9, nTh, 1)];
            S.phi   = [S.phi;   repmat(phS, nTh, 1)];
            S.theta = [S.theta; th];
            S.Q     = [S.Q;     Q];
        end
    end
end
