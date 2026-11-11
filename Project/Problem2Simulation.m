%% Part 2: Linear array of open-ended waveguides (WR-28) along y, d = lambda/2, 30 GHz
% Analytical model used to choose N and to predict the HFSS results:
%   element : TE10 aperture a x b in an infinite ground plane (Balanis, Table 12.1)
%             -> models the OEWG with the 2 mm front panel; radiation into z > 0 only
%   array   : AF(theta,phi) = sum_n w_n exp(j k y_n sin(theta) sin(phi))
%   pattern : E = E_element * AF  (no mutual coupling, no panel edge diffraction)
%
% Q1  uniform array: N sweep, D in 13.5..15 dB, co/cross cuts in phi = 0 / 90 deg
% Q2  Dolph-Chebyshev taper with first SLL <= -30 dB, excitation table for HFSS
% Q3  uniform amplitude, progressive phase, beam at theta = 30 deg in the array plane
%
% No toolboxes required (Dolph-Chebyshev weights computed by dolphCheb below)
clear; close all; clc;

%% ---- Configuration -------------------------------------------------------
baseDir = fileparts(mfilename('fullpath'));
cfg.outDir  = fullfile(baseDir,'plotresults','Part2');
cfg.formats = {'png','pdf'};

c0  = 299792458;
f   = 30e9;
lam = c0/f;
k   = 2*pi/lam;
a   = 7.112e-3;           % WR-28 broad wall (along x)
b   = 3.556e-3;           % WR-28 narrow wall (along y = array axis, E-field direction)
d   = lam/2;              % element spacing along y

cfg.Nsweep  = 2:10;       % for the N-selection plot
cfg.N       = 5;          % chosen number of elements
cfg.Dmin    = 13.5;  cfg.Dmax = 15;      % target directivity window [dBi]
cfg.SLLdes  = 30;         % Chebyshev design side lobe level [dB]; raise to 32-33
                          % if HFSS (mutual coupling) ends up above -30 dB
cfg.theta0  = 30;         % scan angle in the array plane (phi = 90 deg) [deg]
cfg.floor   = -60;        % plot floor relative to peak [dB]

% Optional HFSS overlays (same CSV layout as Part 1: Freq, Phi, Theta, dB(...)).
% Leave the files absent and the plots show theory only.
cfg.hfss.Q1 = fullfile(baseDir,'Simulation_Results','Array_Q1_uniform.csv');
cfg.hfss.Q2 = fullfile(baseDir,'Simulation_Results','Array_Q2_chebyshev.csv');
cfg.hfss.Q3 = fullfile(baseDir,'Simulation_Results','Array_Q3_scan30.csv');

if ~exist(cfg.outDir,'dir'), mkdir(cfg.outDir); end
fprintf('f = %.1f GHz, lambda = %.3f mm, d = %.3f mm, a x b = %.3f x %.3f mm\n', ...
        f/1e9, lam*1e3, d*1e3, a*1e3, b*1e3);
if d <= b, warning('Spacing d = %.2f mm <= waveguide height b: elements overlap', d*1e3); end

% Integration grid (front hemisphere, ground-plane model)
G.th = linspace(0,pi/2,361);
G.ph = linspace(0,2*pi,721);
[G.T,G.P] = ndgrid(G.th,G.ph);

% Signed-theta grid for principal-plane cuts
tc = linspace(-90,90,1801);

%% ---- Q1: uniform array ---------------------------------------------------
% Theoretical array factor (uniform, broadside, along y):
%   AF(psi) = sum_{n=1}^{N} exp(j (n-1) psi) = exp(j(N-1)psi/2) * sin(N psi/2)/sin(psi/2)
%   psi     = k d sin(theta) sin(phi) + beta,   beta = 0 (broadside)
%   normalised: AF_n = sin(N psi/2) / (N sin(psi/2))
fprintf('\nQ1: AF_n(theta,phi) = sin(N*psi/2)/(N*sin(psi/2)),  psi = k*d*sin(theta)*sin(phi) + beta\n');
fprintf('    with k*d = pi (d = lambda/2): psi = pi*sin(theta)*sin(phi), beta = 0\n');

% Directivity vs N
D0el = directivity(ones(1,1),1,G,k,a,b,d);
DN   = arrayfun(@(N) directivity(ones(1,N),N,G,k,a,b,d), cfg.Nsweep);
fprintf('\nElement (OEWG in ground plane): D0 = %.2f dBi\n', D0el);
fprintf('  N   D0 [dBi]   D0el+10log10(N)\n');
for i = 1:numel(cfg.Nsweep)
    fl = ''; if DN(i) >= cfg.Dmin && DN(i) <= cfg.Dmax, fl = '  <-- in window'; end
    fprintf('%3d   %6.2f     %6.2f%s\n', cfg.Nsweep(i), DN(i), D0el+10*log10(cfg.Nsweep(i)), fl);
end

fig = figure('Name','D vs N'); hold on; grid on;
patch([cfg.Nsweep(1)-0.5 cfg.Nsweep(end)+0.5 cfg.Nsweep(end)+0.5 cfg.Nsweep(1)-0.5], ...
      [cfg.Dmin cfg.Dmin cfg.Dmax cfg.Dmax], [0.85 0.95 0.85], 'EdgeColor','none', ...
      'DisplayName','Target 13.5-15 dBi');
plot(cfg.Nsweep, DN, 'ko-', 'LineWidth',1.3, 'MarkerFaceColor','k', 'DisplayName','Array (model)');
plot(cfg.Nsweep, D0el + 10*log10(cfg.Nsweep), 'b--', 'DisplayName','D_{el} + 10log_{10}N');
iN = cfg.Nsweep == cfg.N;
plot(cfg.N, DN(iN), 'rp', 'MarkerSize',14, 'MarkerFaceColor','r', 'DisplayName',sprintf('Chosen N = %d',cfg.N));
xlabel('N'); ylabel('D_0 [dBi]'); title('Uniform \lambda/2 array of OEWGs, 30 GHz');
xlim([cfg.Nsweep(1)-0.5 cfg.Nsweep(end)+0.5]); legend('Location','southeast');
saveFig(fig,cfg.outDir,'Q1_D_vs_N',cfg.formats);

% Patterns of the chosen uniform array
N   = cfg.N;
yn  = ((1:N) - (N+1)/2) * d;          % element positions, centred on origin
wU  = ones(1,N);
[D1, Ppk1] = directivity(wU,N,G,k,a,b,d);
cut1 = principalCuts(wU,yn,tc,k,a,b,Ppk1,D0el);
fprintf('\nChosen N = %d: D0 = %.2f dBi\n', N, D1);

fig = figure('Name','Q1 uniform','Position',[100 100 1200 420]);
plotCut(subplot(1,2,1), cut1.phi0,  tc, 'Uniform', cfg, readHFSS(cfg.hfss.Q1, 0));
title(sprintf('\\phi = 0° (xz, \\perp array), N = %d uniform', N));
plotCut(subplot(1,2,2), cut1.phi90, tc, 'Uniform', cfg, readHFSS(cfg.hfss.Q1, 90));
title(sprintf('\\phi = 90° (yz, array plane), N = %d uniform', N));
saveFig(fig,cfg.outDir,'Q1_uniform_cuts',cfg.formats);

m1 = cutMetrics(tc, cut1.phi90.co);
fprintf('  phi = 90: HPBW = %.1f deg, first SLL = %.2f dB\n', m1.hpbw, m1.sll1);
m1b = cutMetrics(tc, cut1.phi0.co);
fprintf('  phi =  0: HPBW = %.1f deg (element H-plane pattern)\n', m1b.hpbw);

%% ---- Q2: Dolph-Chebyshev taper --------------------------------------------
wC = dolphCheb(N, cfg.SLLdes);   wC = wC / max(wC);
[D2, Ppk2] = directivity(wC,N,G,k,a,b,d);
cut2 = principalCuts(wC,yn,tc,k,a,b,Ppk2,D0el);
m2   = cutMetrics(tc, cut2.phi90.co);
eta_t = abs(sum(wC))^2 / (N*sum(abs(wC).^2));     % taper efficiency of the AF

fprintf('\nQ2: Dolph-Chebyshev, design SLL = -%g dB\n', cfg.SLLdes);
Q2tab = table((1:N).', yn.'*1e3, wC.', 20*log10(wC.'), (wC.').^2, zeros(N,1), ...
    'VariableNames',{'Element','y_mm','Amplitude','Amplitude_dB','HFSS_Power_W','Phase_deg'});
disp(Q2tab);
fprintf('  D0 = %.2f dBi (uniform %.2f dBi, taper loss %.2f dB, AF taper efficiency %.3f)\n', ...
        D2, D1, D1-D2, eta_t);
fprintf('  phi = 90: HPBW = %.1f deg (uniform %.1f), first SLL = %.2f dB\n', m2.hpbw, m1.hpbw, m2.sll1);
fprintf(['  NOTE: HFSS "Edit Sources" magnitude is incident POWER for wave ports,\n' ...
         '        so enter HFSS_Power_W = amplitude^2, not the amplitude.\n']);
writetable(Q2tab, fullfile(cfg.outDir,'Q2_excitations.csv'));

fig = figure('Name','Q2 Chebyshev','Position',[100 100 1200 420]);
ax = subplot(1,2,1);
plotCut(ax, cut2.phi90, tc, 'Chebyshev', cfg, readHFSS(cfg.hfss.Q2, 90));
plot(ax, tc, cut1.phi90.co, ':', 'Color',[0.5 0.5 0.5], 'DisplayName','Uniform (Q1)');
markPeakSLL(ax, tc, cut2.phi90.co, m2, D2);
title(ax, sprintf('\\phi = 90° (array plane), Chebyshev %g dB, N = %d', cfg.SLLdes, N));
ax = subplot(1,2,2);
stem(ax, 1:N, wC, 'filled', 'LineWidth',1.3); grid(ax,'on');
xlabel(ax,'Element n'); ylabel(ax,'Relative amplitude'); ylim(ax,[0 1.1]);
title(ax,'Excitation amplitudes (phase = 0°)');
text(ax, 1:N, wC+0.05, compose('%.3f',wC), 'HorizontalAlignment','center');
saveFig(fig,cfg.outDir,'Q2_chebyshev',cfg.formats);

%% ---- Q3: scanned beam at theta0 in the array plane --------------------------
% Max at theta0 (phi = 90):  psi = k d sin(theta0) + beta = 0  ->  beta = -k d sin(theta0)
% Element phases alpha_n = -k y_n sin(theta0)   (time convention e^{+j w t}, as HFSS)
th0   = deg2rad(cfg.theta0);
beta  = -k*d*sin(th0);
alpha = -k*yn*sin(th0);
wS    = exp(1j*alpha);
[D3, Ppk3, thpk, phpk] = directivity(wS,N,G,k,a,b,d);
cut3  = principalCuts(wS,yn,tc,k,a,b,Ppk3,D0el);
m3    = cutMetrics(tc, cut3.phi90.co);

phRef = wrap180(rad2deg(alpha - alpha(1)));      % element 1 as 0° reference
Q3tab = table((1:N).', yn.'*1e3, ones(N,1), wrap180(rad2deg(alpha)).', phRef.', ...
    'VariableNames',{'Element','y_mm','HFSS_Power_W','Phase_deg_centred','Phase_deg_ref_el1'});
fprintf('\nQ3: scan to theta0 = %g deg in phi = 90 plane\n', cfg.theta0);
fprintf('  progressive phase beta = %.1f deg per element (along +y)\n', rad2deg(beta));
disp(Q3tab);
fprintf('  D0 = %.2f dBi at (theta, phi) = (%.1f, %.0f) deg  vs broadside %.2f dBi\n', ...
        D3, thpk, phpk, D1);
fprintf('  scan loss = %.2f dB; projected-aperture estimate 10log10(cos theta0) = %.2f dB\n', ...
        D1-D3, -10*log10(cos(th0)));
fprintf('  HPBW = %.1f deg (broadside %.1f deg)\n', m3.hpbw, m1.hpbw);
fprintf('  If HFSS shows the beam at -%g deg instead, flip the sign of all phases.\n', cfg.theta0);
writetable(Q3tab, fullfile(cfg.outDir,'Q3_excitations.csv'));

fig = figure('Name','Q3 scan','Position',[100 100 1200 420]);
ax = subplot(1,2,1);
plotCut(ax, cut3.phi90, tc, sprintf('Scan %g°',cfg.theta0), cfg, readHFSS(cfg.hfss.Q3, 90));
plot(ax, tc, cut1.phi90.co, ':', 'Color',[0.5 0.5 0.5], 'DisplayName','Broadside (Q1)');
xline(ax, cfg.theta0, '--', 'HandleVisibility','off');
title(ax, sprintf('\\phi = 90°, uniform, \\beta = %.0f°/element', rad2deg(beta)));
% Absolute directivity cut to show the scan loss (not normalised)
ax = subplot(1,2,2); hold(ax,'on'); grid(ax,'on');
plot(ax, tc, cut1.phi90.Dabs, 'k-', 'LineWidth',1.3, 'DisplayName',sprintf('Broadside, D_0 = %.2f dBi',D1));
plot(ax, tc, cut3.phi90.Dabs, 'r-', 'LineWidth',1.3, 'DisplayName',sprintf('Scan %g°, D_0 = %.2f dBi',cfg.theta0,D3));
el = cut1.phi90.Del;  plot(ax, tc, el, 'b--', 'DisplayName','Single element');
xlim(ax,[-90 90]); ylim(ax,[D1-30 D1+2]); xticks(ax,-90:30:90);
xlabel(ax,'\theta [deg]'); ylabel(ax,'D [dBi]');
title(ax, sprintf('Scan loss %.2f dB', D1-D3)); legend(ax,'Location','south');
saveFig(fig,cfg.outDir,'Q3_scan',cfg.formats);

%% ---- Save everything -------------------------------------------------------
R = struct('f',f,'lam',lam,'d',d,'a',a,'b',b,'N',N,'yn',yn,'theta_cut',tc, ...
           'D_el',D0el,'Nsweep',cfg.Nsweep,'D_vs_N',DN, ...
           'Q1',struct('w',wU,'D0',D1,'cuts',cut1,'metrics',m1), ...
           'Q2',struct('w',wC,'D0',D2,'cuts',cut2,'metrics',m2,'SLLdes',cfg.SLLdes), ...
           'Q3',struct('w',wS,'D0',D3,'cuts',cut3,'metrics',m3,'theta0',cfg.theta0, ...
                       'beta_deg',rad2deg(beta),'theta_peak',thpk));
save(fullfile(cfg.outDir,'array_part2_results.mat'),'R');
fprintf('\nPlots and tables written to %s\n', cfg.outDir);

%% ======================= Local functions ==================================
function [Eth,Eph] = elementField(T,P,k,a,b)
    % TE10 aperture (E along y) in an infinite ground plane, Balanis Table 12.1.
    % Common factor C = j a b k E0 e^{-jkr}/(2 pi r) omitted.
    X  = k*a/2*sin(T).*cos(P);
    Y  = k*b/2*sin(T).*sin(P);
    den = X.^2 - (pi/2)^2;
    fx = cos(X)./den;
    fx(abs(den) < 1e-9) = -1/pi;                 % limit at X = +-pi/2
    fy = ones(size(Y));  nz = Y ~= 0;  fy(nz) = sin(Y(nz))./Y(nz);
    Eth = -(pi/2) * sin(P)          .* fx .* fy;
    Eph = -(pi/2) * cos(T).*cos(P)  .* fx .* fy;
end

function AF = arrayFactor(T,P,w,yn,k)
    AF = zeros(size(T));
    for n = 1:numel(w)
        AF = AF + w(n) * exp(1j*k*yn(n)*sin(T).*sin(P));
    end
end

function [D0,Prad,thpk,phpk] = directivity(w,N,G,k,a,b,d)
    % Numerical D0 = 4 pi Umax / Prad over the front hemisphere.
    % Prad is also returned so cuts can be given in absolute dBi.
    yn = ((1:N) - (N+1)/2) * d;
    [Et,Ep] = elementField(G.T,G.P,k,a,b);
    AF = arrayFactor(G.T,G.P,w,yn,k);
    U  = (abs(Et).^2 + abs(Ep).^2) .* abs(AF).^2;
    Prad = trapz(G.th, trapz(G.ph, U, 2) .* sin(G.th(:)));
    [Umax,i] = max(U(:));
    D0 = 10*log10(4*pi*Umax/Prad);
    [it,ip] = ind2sub(size(U),i);
    thpk = rad2deg(G.th(it));  phpk = rad2deg(G.ph(ip));
end

function c = principalCuts(w,yn,tc,k,a,b,Prad,D0el)
    % phi = 0 and phi = 90 cuts over signed theta (-90..90 deg).
    % Ludwig-3 with y as reference (co) polarisation:
    %   co = Eth sin(phi) + Eph cos(phi),   cross = Eth cos(phi) - Eph sin(phi)
    % Returns normalised co/cross [dB] and absolute directivity [dBi].
    th = deg2rad(abs(tc));
    for pl = [0 90]
        ph = deg2rad(pl) + pi*(tc < 0);          % negative theta = phi + 180
        [Et,Ep] = elementField(th,ph,k,a,b);
        AF = arrayFactor(th,ph,w,yn,k);
        Eco = (Et.*sin(ph) + Ep.*cos(ph)) .* AF;
        Ecx = (Et.*cos(ph) - Ep.*sin(ph)) .* AF;
        U   = abs(Eco).^2 + abs(Ecx).^2;
        Dco = 10*log10(4*pi*abs(Eco).^2/Prad);
        Dcx = 10*log10(4*pi*abs(Ecx).^2/Prad + realmin);
        Uel = abs(Et).^2 + abs(Ep).^2;           % single element pattern
        s.co    = Dco - max(Dco);
        s.cross = Dcx - max(Dco);
        s.Dabs  = 10*log10(4*pi*U/Prad);
        s.Del   = D0el + 10*log10(Uel/max(Uel) + realmin);   % element in dBi
        c.(sprintf('phi%d',pl)) = s;
    end
end

function m = cutMetrics(t,D)
    % HPBW and first side lobe of a normalised cut (dB, peak = 0)
    [~,i0] = max(D);
    lv = D(i0) - 3;
    i1 = find(D(1:i0) < lv,1,'last');  i2 = i0-1+find(D(i0:end) < lv,1,'first');
    if isempty(i1) || isempty(i2), m.hpbw = NaN;
    else
        m.hpbw = interp1(D([i2-1 i2]),t([i2-1 i2]),lv) - interp1(D([i1 i1+1]),t([i1 i1+1]),lv);
    end
    % first nulls on each side, then first local maximum beyond each
    iL = i0; while iL > 1 && D(iL-1) < D(iL), iL = iL-1; end
    iR = i0; while iR < numel(D) && D(iR+1) < D(iR), iR = iR+1; end
    pk = find(D(2:end-1) > D(1:end-2) & D(2:end-1) >= D(3:end)) + 1;
    pL = pk(pk < iL);  pR = pk(pk > iR);
    cand = [];  if ~isempty(pL), cand(end+1) = pL(end); end
    if ~isempty(pR), cand(end+1) = pR(1); end
    if isempty(cand), m.sll1 = NaN; m.iSLL = []; m.i0 = i0; return; end
    [m.sll1,j] = max(D(cand));  m.iSLL = cand(j);  m.i0 = i0;
    m.sll1 = m.sll1 - D(i0);
end

function plotCut(ax,s,tc,lbl,cfg,H)
    hold(ax,'on'); grid(ax,'on');
    plot(ax, tc, s.co, 'k-', 'LineWidth',1.3, 'DisplayName',[lbl ' co-pol (model)']);
    cx = max(s.cross, cfg.floor-10);
    plot(ax, tc, cx, 'k--', 'LineWidth',1.0, 'DisplayName',[lbl ' cross-pol (model, = 0)']);
    if ~isempty(H)
        cols = lines(size(H.Q,2));
        for q = 1:size(H.Q,2)
            plot(ax, H.t, H.Q(:,q) - max(H.Q(:,1)), '-', 'Color',cols(q,:), 'LineWidth',1.1, ...
                 'DisplayName',['HFSS ' H.qnames{q}]);
        end
    end
    xlim(ax,[-90 90]); ylim(ax,[cfg.floor 3]); xticks(ax,-90:30:90);
    xlabel(ax,'\theta [deg]'); ylabel(ax,'Normalised directivity [dB]');
    legend(ax,'Location','south','Interpreter','tex');
end

function markPeakSLL(ax,tc,D,m,D0)
    plot(ax, tc(m.i0), D(m.i0), 'ro', 'MarkerSize',8, 'MarkerFaceColor','r', ...
         'DisplayName',sprintf('On-axis: 0 dB (D_0 = %.2f dBi)', D0));
    if ~isempty(m.iSLL)
        plot(ax, tc(m.iSLL), D(m.iSLL), 'bv', 'MarkerSize',8, 'MarkerFaceColor','b', ...
             'DisplayName',sprintf('1st SLL: %.2f dB', m.sll1));
        yline(ax, -30, ':', '-30 dB', 'HandleVisibility','off');
    end
end

function H = readHFSS(file,phi)
    % Reads an HFSS cut export (Freq, Phi, Theta, dB(...) columns) and returns the
    % phi-cut as signed theta -90..90 (phi+180 mapped to negative theta).
    % HFSS exports theta = -180..180 at fixed phi: negative theta is already the other half.
    H = [];
    if ~isfile(file), return; end
    tbl = readtable(file,'VariableNamingRule','preserve');
    vn  = strtrim(tbl.Properties.VariableNames);
    iP  = find(startsWith(vn,'Phi','IgnoreCase',true),1);
    iT  = find(startsWith(vn,'Theta','IgnoreCase',true),1);
    iF  = find(startsWith(vn,'Freq','IgnoreCase',true),1);
    iQ  = setdiff(1:numel(vn),[iF iP iT],'stable');
    sel = abs(mod(tbl{:,iP} - phi + 180,360) - 180) < 1e-6;
    t   = tbl{sel,iT};  Q = tbl{sel,iQ};
    keep = abs(t) <= 90;
    [H.t,o] = sort(t(keep));  Q = Q(keep,:);  H.Q = Q(o,:);
    H.qnames = regexprep(vn(iQ),'^\s*dB\(\s*([^)]*?)\s*\).*$','$1');
    if isempty(H.t), H = []; end
end

function w = dolphCheb(N,SLL)
    % Dolph-Chebyshev weights (same algorithm as chebwin, no toolbox needed).
    % Samples T_{N-1}(x0 cos(pi k/N)) and inverse-transforms to element amplitudes.
    M  = N-1;
    x0 = cosh(acosh(10^(SLL/20))/M);
    x  = x0*cos(pi*(0:N-1)/N);
    p  = zeros(1,N);
    i1 = x > 1;  i2 = x < -1;  i3 = ~(i1|i2);
    p(i1) = cosh(M*acosh(x(i1)));
    p(i2) = (1-2*mod(M,2))*cosh(M*acosh(-x(i2)));
    p(i3) = cos(M*acos(x(i3)));
    if mod(N,2)
        w = real(fft(p));  K = (N+1)/2;  w = w(1:K)/w(1);
        w = [w(K:-1:2) w];
    else
        w = real(fft(p.*exp(1j*pi/N*(0:N-1))));  K = N/2+1;  w = w/w(2);
        w = [w(K:-1:2) w(2:K)];
    end
    w = w/max(w);
end

function y = wrap180(x)
    y = mod(x + 180, 360) - 180;
end

function saveFig(fig,outDir,base,formats)
    for k = 1:numel(formats)
        fn = fullfile(outDir,[base '.' formats{k}]);
        if strcmp(formats{k},'fig'), savefig(fig,fn);
        elseif strcmp(formats{k},'pdf'), exportgraphics(fig,fn,'ContentType','vector');
        else, exportgraphics(fig,fn,'Resolution',300);
        end
    end
end