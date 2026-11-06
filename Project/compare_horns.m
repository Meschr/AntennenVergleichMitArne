%% Standard gain horns: theory (Balanis) vs HFSS vs measurement
% Reads:  Theory_Results/theory_horns.mat   (struct T, saved by the theory script)
%         Simulation_Results/Directivity_<band>_2D_*.csv  (one CSV per frequency is fine)
%         Measurement_Results/...  (optional; for now same CSV layout as HFSS)
% Writes: pattern plots, D0-vs-frequency plots and metric tables to plotresults/
clear; close all; clc;

%% ---- Configuration -------------------------------------------------------
cfg.theoryFile    = fullfile('Theory_Results','theory_horns.mat');
cfg.outDir        = 'plotresults';
cfg.formats       = {'png','pdf'};   % add 'fig' to also save MATLAB .fig files
cfg.fTolGHz       = 0.05;            % max mismatch when pairing frequencies
cfg.phiH          = 0;               % H-plane cut in HFSS/measurement [deg]
cfg.phiE          = 90;              % E-plane cut [deg]
cfg.dynRange      = 60;              % plotted dynamic range [dB]
cfg.measAlignPeak = false;           % true: shift measured cut so its peak = theory D0
                                     % (use if the lab data is relative, not absolute)

% One entry per horn; name must match T(n).name in the .mat file.
% hfss/meas accept a single file or a wildcard pattern (files are concatenated).
src(1).name = 'Ka-band';
src(1).hfss = fullfile('Simulation_Results','Directivity_Ka_2D_*.csv');
src(1).meas = '';                    % e.g. fullfile('Measurement_Results','Ka_*.csv')
src(2).name = 'C-band';
src(2).hfss = fullfile('Simulation_Results','Directivity_C_2D_*.csv');
src(2).meas = '';

%% ---- Load theory ---------------------------------------------------------
if ~exist(cfg.outDir,'dir'), mkdir(cfg.outDir); end
L = load(cfg.theoryFile,'T');  T = L.T;

%% ---- Main loop over horns -----------------------------------------------
for n = 1:numel(src)
    s  = src(n);
    iT = find(strcmp({T.name}, s.name), 1);
    if isempty(iT), error('No theory data for "%s" in %s', s.name, cfg.theoryFile); end
    th  = T(iT);
    H   = readCuts(s.hfss);
    M   = loadMeasurement(s.meas);
    tag = matlab.lang.makeValidName(s.name);
    rows = cell(0,7);

    % ---- Pattern cuts, one figure per frequency ----
    for m = 1:numel(th.f)
        fG  = th.f(m)/1e9;
        fig = figure('Name',sprintf('%s %.2f GHz',s.name,fG), ...
                     'Position',[100 100 1200 420]);
        planes = {'E-plane', cfg.phiE, th.DE(m,:);
                  'H-plane', cfg.phiH, th.DH(m,:)};

        for p = 1:2
            [plane,phi,Dth] = planes{p,:};
            ax = subplot(1,2,p); hold(ax,'on'); grid(ax,'on');
            peak = max(Dth);

            % Theory
            plot(ax, th.th_deg, Dth, 'k-', 'LineWidth',1.3, ...
                 'DisplayName','Theory (Balanis)');
            rows(end+1,:) = metricsRow('Theory',plane,fG,th.th_deg,Dth); %#ok<AGROW>

            % HFSS
            [tH,QH,fH] = getCut(H,fG,phi,cfg.fTolGHz);
            if ~isempty(tH)
                plotQuantities(ax,tH,QH,H.qnames,[0 0.35 0.85],'HFSS');
                rows(end+1,:) = metricsRow('HFSS',plane,fH,tH,QH(:,1)); %#ok<AGROW>
                peak = max(peak, max(QH(:,1)));
            elseif ~isempty(H)
                warning('%s: no HFSS cut at %.2f GHz, phi = %g deg', s.name, fG, phi);
            end

            % Measurement
            [tM,QM,fM] = getCut(M,fG,phi,cfg.fTolGHz);
            if ~isempty(tM)
                if cfg.measAlignPeak, QM = QM - max(QM(:,1)) + max(Dth); end
                plotQuantities(ax,tM,QM,M.qnames,[0.85 0.2 0.1],'Meas.');
                rows(end+1,:) = metricsRow('Measured',plane,fM,tM,QM(:,1)); %#ok<AGROW>
                peak = max(peak, max(QM(:,1)));
            end

            xlim(ax,[-180 180]); ylim(ax,[peak-cfg.dynRange, peak+3]);
            xticks(ax,-180:45:180);
            xlabel(ax,'\theta [deg]'); ylabel(ax,'D [dBi]');
            title(ax,sprintf('%s, %s (\\phi = %g°), %.2f GHz',s.name,plane,phi,fG));
            legend(ax,'Location','south','Interpreter','none');
        end
        saveFig(fig, cfg.outDir, sprintf('%s_%s',tag,fstr(fG)), cfg.formats);
    end

    % ---- Max directivity vs frequency ----
    fig = figure('Name',[s.name ' D0 vs f']); hold on; grid on;
    plot(th.f/1e9, th.D0, 'ko-', 'LineWidth',1.3, 'DisplayName','Theory (Balanis)');
    [fu,pk] = peakVsFreq(H,[cfg.phiE cfg.phiH]);
    if ~isempty(fu), plot(fu,pk,'s-','Color',[0 0.35 0.85],'LineWidth',1.3,'DisplayName','HFSS'); end
    [fu,pk] = peakVsFreq(M,[cfg.phiE cfg.phiH]);
    if ~isempty(fu), plot(fu,pk,'d-','Color',[0.85 0.2 0.1],'LineWidth',1.3,'DisplayName','Measured'); end
    xlabel('f [GHz]'); ylabel('D_0 [dBi]'); title([s.name ': maximum directivity']);
    legend('Location','best');
    saveFig(fig, cfg.outDir, [tag '_D0_vs_freq'], cfg.formats);

    % ---- Metrics table ----
    Tm = cell2table(rows,'VariableNames', ...
        {'Source','Plane','f_GHz','D0_dBi','HPBW_deg','SLL_dB','Back_dB'});
    Tm = sortrows(Tm,{'f_GHz','Plane','Source'});
    fprintf('\n===== %s =====\n', s.name); disp(Tm);
    writetable(Tm, fullfile(cfg.outDir, ['metrics_' tag '.csv']));
end

%% ======================= Local functions ==================================
function S = readCuts(spec)
    % Reads one file or all files matching a wildcard pattern and concatenates them.
    S = [];
    if isempty(spec), return; end
    d = dir(spec);
    d = d(~[d.isdir]);
    if isempty(d), warning('No files found for: %s', spec); return; end
    for k = 1:numel(d)
        Sk = readCutFile(fullfile(d(k).folder, d(k).name));
        if isempty(S)
            S = Sk;
        else
            if ~isequal(S.qnames, Sk.qnames)
                error('%s: columns differ from the other files in %s', d(k).name, spec);
            end
            S.f = [S.f; Sk.f];  S.phi = [S.phi; Sk.phi];
            S.theta = [S.theta; Sk.theta];  S.Q = [S.Q; Sk.Q];
        end
    end
    fprintf('Loaded %d file(s) for %s: f = %s GHz\n', numel(d), spec, ...
            mat2str(unique(S.f).'));
end

function S = readCutFile(file)
    % Generic reader for HFSS-style cut exports:
    % columns Freq, Phi, Theta, then one or more dB quantities
    % (e.g. dB(DirTotal), later co/cross-pol columns are picked up automatically).
    tbl = readtable(file,'VariableNamingRule','preserve');
    vn  = tbl.Properties.VariableNames;
    iF  = find(startsWith(vn,'Freq', 'IgnoreCase',true),1);
    iP  = find(startsWith(vn,'Phi',  'IgnoreCase',true),1);
    iT  = find(startsWith(vn,'Theta','IgnoreCase',true),1);
    if isempty(iF) || isempty(iP) || isempty(iT)
        error('%s: need Freq, Phi and Theta columns', file);
    end
    iQ = setdiff(1:numel(vn), [iF iP iT], 'stable');

    fs = 1;                                           % default GHz
    if contains(vn{iF},'[MHz]'), fs = 1e-3; elseif contains(vn{iF},'[Hz]'), fs = 1e-9; end
    as = 1; if contains(vn{iT},'[rad]'), as = 180/pi; end

    S.f      = tbl{:,iF}*fs;
    S.phi    = tbl{:,iP}*as;
    S.theta  = tbl{:,iT}*as;
    S.Q      = tbl{:,iQ};
    S.qnames = regexprep(vn(iQ),'^dB\((.*)\).*$','$1');
end

function S = loadMeasurement(file)
    % Placeholder until the lab data format is known.
    % Must return the same struct as readCuts:
    %   f [GHz], phi [deg], theta [deg], Q (columns in dB), qnames
    S = [];
    if isempty(file), return; end
    [~,~,ext] = fileparts(file);
    switch lower(ext)
        case '.csv'
            S = readCuts(file);      % works if the data is put in HFSS-like layout (wildcards OK)
        otherwise
            error('loadMeasurement: no reader for "%s" files yet', ext);
    end
end

function [t,Q,fAct] = getCut(S,fGHz,phi,tol)
    % Extract one phi-cut at the frequency closest to fGHz (within tol)
    t = []; Q = []; fAct = NaN;
    if isempty(S), return; end
    fu = unique(S.f);
    [df,i] = min(abs(fu - fGHz));
    if df > tol, return; end
    fAct = fu(i);
    sel = abs(S.f - fAct) < 1e-9 & abs(mod(S.phi - phi + 180,360) - 180) < 1e-6;
    if ~any(sel), return; end
    [t,o] = sort(S.theta(sel));
    Qs = S.Q(sel,:);  Q = Qs(o,:);
end

function plotQuantities(ax,t,Q,qnames,col,label)
    % First column solid (main quantity), further columns (e.g. cross-pol) dashed/dotted
    styles = {'-','--',':','-.'};
    for q = 1:size(Q,2)
        plot(ax, t, Q(:,q), styles{mod(q-1,4)+1}, 'Color',col, 'LineWidth',1.1, ...
             'DisplayName', sprintf('%s %s',label,qnames{q}));
    end
end

function r = metricsRow(srcName,plane,fG,t,D)
    t = t(:); D = D(:);
    [mx,i0] = max(D);
    r = {srcName, plane, fG, mx, hpbw(t,D,i0), sll(D,i0), backLevel(t,D) - mx};
end

function w = hpbw(t,D,i0)
    % Half-power beamwidth [deg], linearly interpolated -3 dB crossings
    lv = D(i0) - 3;
    i1 = find(D(1:i0) < lv, 1, 'last');
    i2 = i0 - 1 + find(D(i0:end) < lv, 1, 'first');
    if isempty(i1) || isempty(i2), w = NaN; return; end
    t1 = interp1(D([i1 i1+1]), t([i1 i1+1]), lv);
    t2 = interp1(D([i2-1 i2]), t([i2-1 i2]), lv);
    w  = t2 - t1;
end

function s = sll(D,i0)
    % Highest side lobe relative to the peak [dB], both sides of the cut.
    % Main lobe = region between the first minima on either side of the peak.
    iL = i0; while iL > 1         && D(iL-1) < D(iL), iL = iL - 1; end
    iR = i0; while iR < numel(D)  && D(iR+1) < D(iR), iR = iR + 1; end
    pk = find(D(2:end-1) > D(1:end-2) & D(2:end-1) >= D(3:end)) + 1;
    pk = pk(pk < iL | pk > iR);
    if isempty(pk), s = NaN; else, s = max(D(pk)) - D(i0); end
end

function b = backLevel(t,D)
    % Directivity at theta = +-180 deg (back direction)
    [~,ib] = max(abs(t));
    b = D(ib);
end

function [fu,pk] = peakVsFreq(S,phis)
    % Peak of the main quantity over the given phi-cuts, per frequency
    fu = []; pk = [];
    if isempty(S), return; end
    fu = unique(S.f);  pk = nan(size(fu));
    onCut = any(abs(mod(S.phi(:) - phis(:).' + 180,360) - 180) < 1e-6, 2);
    for k = 1:numel(fu)
        sel = S.f == fu(k) & onCut;
        if any(sel), pk(k) = max(S.Q(sel,1)); end
    end
end

function str = fstr(fG)
    str = strrep(sprintf('%.2fGHz',fG),'.','p');   % 26.50 GHz -> 26p50GHz
end

function saveFig(fig,outDir,base,formats)
    for k = 1:numel(formats)
        fn = fullfile(outDir,[base '.' formats{k}]);
        switch formats{k}
            case 'fig', savefig(fig,fn);
            case 'pdf', exportgraphics(fig,fn,'ContentType','vector');
            otherwise,  exportgraphics(fig,fn,'Resolution',300);
        end
    end
end