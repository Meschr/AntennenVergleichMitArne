clear;
clc;
close all;

%% Constants
c  = 3e8;       % speed of light
f0 = 3e9;       % resonance frequency
er = 2.33;      % relative permittivity of RT/duroid 5870
h  = 1.5e-3;    % substrate height

%% Patch dimensions

% Patch width
W = c/(2*f0)*sqrt(2/(er+1));

% Effective permittivity
eeff = (er+1)/2 + ...
    (er-1)/2*(1 + 12*h/W)^(-0.5);

% Effective length
Leff = c/(2*f0*sqrt(er));     % er instead of eeff

% Fringing extension
dL = 0.412*h * ...
    ((eeff+0.3)*(W/h+0.264)) / ...
    ((eeff-0.258)*(W/h+0.8));

% Physical patch length
L = Leff - 2*dL;

fprintf('W = %.2f mm\n', W*1e3);
fprintf('L = %.2f mm\n', L*1e3);
fprintf('eeff = %.3f\n', eeff);
fprintf('dL = %.2f mm\n', dL*1e3);

%% Array properties
N = 51;
dspacing = 0.8;                 % spacing in wavelengths
d = (0:N-1)*dspacing;

dtheta = 0.5;                   % fine enough grid for a converged D0
dphi   = 0.5;

theta_full = 0:dtheta:180;
phi_full   = 0:dphi:360;
[THE, PHI] = meshgrid(theta_full, phi_full);

%% Angles from the student IDs
% Arne: 70, Marcel: 34
theta0   = mod(34,30);        % main beam direction (scan angle)
theta_null = -mod(70,30);       % null direction: 70 > 35 -> mod 30 -> -10 deg

%% Null steering in addition to main beam steering
u0     = sind(theta0);
u_null = sind(theta_null);

n = 0:N-1;
d = n*dspacing;

psi_null = 2*pi*dspacing*(u_null - u0);
z_null   = exp(1j*psi_null);

% Natural nulls of the uniform excitation
k = 1:N-1;
z_natural = exp(1j*2*pi*k/N);

% Replace the natural null closest to the desired one
[~, k0] = min(abs(z_natural - z_null));
z_natural(k0) = z_null;

% Reconstruct the amplitude taper from the modified roots
p_new = poly(z_natural);        % descending powers
A = fliplr(p_new);              % A(n+1) = amplitude of element n

% Final excitation: taper + steering phase
I = A .* exp(-1j*2*pi*d*u0);

%% Check: isotropic array factor
AF_full = ArrayFactor(d, I, THE, PHI);
AF_null = ArrayFactor(d, I, theta_null, 90);
AF_null_dB = 10*log10(abs(AF_null)^2/max(abs(AF_full(:)).^2) + eps);
[D0, D0_dB] = Directivity(AF_full, theta_full, phi_full);

fprintf('D0 = %.2f dBi (target: >= 19)\n', D0_dB)
fprintf('Level at theta_null = %d deg: %.2f dB relative to peak (target: <= -30)\n', ...
    theta_null, AF_null_dB)



%% Isotropic array factor with null steering: E-/H-plane, theta in [-90, 90]
% Keep the isotropic values, the patch section below overwrites D0/D0_dB
D0_iso    = D0;
D0_iso_dB = D0_dB;
Umax_iso  = max(abs(AF_full(:)).^2);      % same reference as D0_iso

theta_cut  = -90:0.1:90;
planes     = [0 90];
planeNames = {'E-plane (\phi = 0°)', 'H-plane (\phi = 90°, contains array)'};

figure('Name', 'Array factor with null steering (isotropic elements)')
hold on
D_iso = zeros(2, numel(theta_cut));
for p = 1:2
    phi_line = planes(p)*ones(size(theta_cut));
    AF_cut   = ArrayFactor(d, I, theta_cut, phi_line);

    D_iso(p,:) = 10*log10(D0_iso * abs(AF_cut).^2 / Umax_iso + eps);
    plot(theta_cut, D_iso(p,:), 'LineWidth', 1.3, 'DisplayName', planeNames{p})
end

yline(D0_iso_dB, '--k', sprintf('D_0 = %.2f dBi', D0_iso_dB), 'HandleVisibility', 'off')
yline(-30, ':r', '-30 dBi', 'HandleVisibility', 'off')
xline(theta_null, '--m', sprintf('\\theta_{null} = %d°', theta_null), 'HandleVisibility', 'off')

xlabel('\theta (deg)'); ylabel('D(\theta,\phi) (dBi)')
title(sprintf('Array factor with null steering: N = %d, d = %.2f\\lambda, \\theta_0 = %d°', ...
    N, dspacing, theta0))
xlim([-90 90]); ylim([-60 D0_iso_dB+3])
legend('Location', 'southwest'); grid on

%% Numbers for the report (isotropic case)
D_H = D_iso(2,:);                                   % H-plane cut
[Dmax_cut, im] = max(D_H);
lvl  = Dmax_cut - 3;
iL   = find(D_H < lvl & theta_cut < theta_cut(im), 1, 'last');
iR   = find(D_H < lvl & theta_cut > theta_cut(im), 1, 'first');
hpbw = theta_cut(iR) - theta_cut(iL);

AF_n   = ArrayFactor(d, I, theta_null, 90);
D_null = 10*log10(D0_iso * abs(AF_n)^2 / Umax_iso + eps);

fprintf('D0 = %.2f dBi, main beam at %.1f deg, 3 dB beamwidth = %.2f deg\n', ...
    D0_iso_dB, theta_cut(im), hpbw)
fprintf('Level at theta_null = %d deg: %.1f dBi (target: <= -30 dBi)\n', theta_null, D_null)

%% Visualization of the amplitude taper
A_norm      = abs(A) / max(abs(A));     % normalized taper (max = 1)
phase_total = unwrap(angle(I));         % total phase per element (taper + steering)
phase_steer = -2*pi*d*u0;               % steering phase only, for comparison

figure('Name', 'Amplitude taper and phase distribution')

subplot(3,1,1)
stem(n, ones(1,N), 'Color', [0.6 0.6 0.6], 'DisplayName', 'uniform (reference)'); hold on
stem(n, A_norm, 'filled', 'LineWidth', 1.2, 'DisplayName', '|A_n| null steering')
xlabel('Element n'); ylabel('|A_n| (norm.)')
title(sprintf('Amplitude taper, N = %d, \\theta_{null} = %d°', N, theta_null))
ylim([0 1.1]); legend('Location', 'southwest'); grid on

subplot(3,1,2)
plot(n, rad2deg(angle(A)), 'o-', 'LineWidth', 1.2)
xlabel('Element n'); ylabel('arg(A_n) (deg)')
title('Phase part of the taper (null correction)')
grid on

subplot(3,1,3)
plot(n, rad2deg(phase_total), 'o-', 'LineWidth', 1.2, 'DisplayName', 'arg(I_n) total'); hold on
plot(n, rad2deg(phase_steer), 's--', 'LineWidth', 1.2, 'DisplayName', 'steering phase only')
xlabel('Element n'); ylabel('Phase (deg)')
title('Total excitation phase')
legend show; grid on

%% Array factor and fields including the patch element
AF    = ArrayFactor(d, I, THE, PHI);
E_el  = PatchElement(THE, PHI, L, W, f0);
E_tot = E_el .* AF;

[D0, D0_dB] = Directivity(E_tot, theta_full, phi_full);

%% Directivity pattern of the patch array (E- and H-plane), theta in [-90, 90]
theta_cut  = -90:0.1:90;
planes     = [0 90];
planeNames = {'E-plane (\phi = 0°)', 'H-plane (\phi = 90°, contains array)'};

% same reference as for D0: peak of the total pattern over the whole sphere
Umax_full = max(abs(E_tot(:)).^2);

figure('Name', 'Patch array directivity')
hold on
for p = 1:2
    phi_line = planes(p)*ones(size(theta_cut));

    E_cut = PatchElement(theta_cut, phi_line, L, W, f0) ...
        .* ArrayFactor(d, I, theta_cut, phi_line);

    U_norm = abs(E_cut).^2 / Umax_full;
    D_dB   = 10*log10(D0*U_norm + eps);

    plot(theta_cut, D_dB, 'LineWidth', 1.3, 'DisplayName', planeNames{p})
end

yline(D0_dB, '--k', sprintf('D_0 = %.2f dBi', D0_dB), 'HandleVisibility', 'off')
xline(theta_null, '--m', sprintf('\\theta_{null} = %d°', theta_null), 'HandleVisibility', 'off')

xlabel('\theta (deg)'); ylabel('D(\theta,\phi) (dBi)')
title(sprintf('Patch array: N = %d, d = %.2f\\lambda, \\theta_0 = %d°, D_0 = %.2f dBi', ...
    N, dspacing, theta0, D0_dB))
xlim([-90 90]); ylim([D0_dB-60 D0_dB+3])
legend('Location', 'southwest'); grid on

%% 3D directivity pattern of the patch array
skip = 2;                               % thin out the grid for plotting (speed)
TH = THE(1:skip:end, 1:skip:end);
PH = PHI(1:skip:end, 1:skip:end);
Et = E_tot(1:skip:end, 1:skip:end);

% directivity in dBi, same reference as D0
U_norm = abs(Et).^2 / max(abs(E_tot(:)).^2);
D_dB   = 10*log10(D0*U_norm + eps);

% radius: dBi with limited dynamic range (30 dB below peak), otherwise the lobe becomes tiny
dyn       = 30;
D_dB_clip = max(D_dB, D0_dB - dyn);
R = D_dB_clip - (D0_dB - dyn);          % 0 ... dyn

X = R .* sind(TH) .* cosd(PH);
Y = R .* sind(TH) .* sind(PH);
Z = R .* cosd(TH);

figure('Name', '3D directivity pattern')
surf(X, Y, Z, D_dB_clip, 'EdgeColor', 'none', 'FaceAlpha', 0.95)
axis equal; grid on
xlabel('x'); ylabel('y (array axis)'); zlabel('z (broadside)')
cb = colorbar; cb.Label.String = 'D (dBi)';
clim([D0_dB - dyn, D0_dB])
colormap turbo
camlight headlight; lighting gouraud
view(135, 25)
title(sprintf('N = %d, d = %.2f\\lambda, \\theta_0 = %d°, D_0 = %.2f dBi', ...
    N, dspacing, theta0, D0_dB))

%% 2D radiation patterns in the three principal planes (polar, dBi)
Umax_full = max(abs(E_tot(:)).^2);      % same reference as D0
dyn  = 40;                              % dynamic range in dB below D0
rmin = D0_dB - dyn;

Dfun = @(the, phi) max(10*log10(D0 * abs( ...
    PatchElement(the, phi, L, W, f0) .* ArrayFactor(d, I, the, phi) ...
    ).^2 / Umax_full + eps), rmin);

ang = -180:0.1:180;                     % angle in degrees

figure('Name', '2D principal planes', 'Position', [100 100 1300 420])

% --- xz-plane (phi = 0), theta measured from the z-axis ---
subplot(1,3,1)
polarplot(deg2rad(ang), Dfun(ang, zeros(size(ang))), 'LineWidth', 1.3)
title('xz-plane (\phi = 0°, E-plane)')
ax = gca; ax.ThetaZeroLocation = 'top'; ax.ThetaDir = 'clockwise';
rlim([rmin D0_dB+3])

% --- yz-plane (phi = 90), contains the array axis ---
subplot(1,3,2)
polarplot(deg2rad(ang), Dfun(ang, 90*ones(size(ang))), 'LineWidth', 1.3)
title('yz-plane (\phi = 90°, H-plane, array axis)')
ax = gca; ax.ThetaZeroLocation = 'top'; ax.ThetaDir = 'clockwise';
rlim([rmin D0_dB+3])

% --- xy-plane (theta = 90), phi measured from the x-axis ---
phi_xy = 0:0.1:360;
subplot(1,3,3)
polarplot(deg2rad(phi_xy), Dfun(90*ones(size(phi_xy)), phi_xy), 'LineWidth', 1.3)
title('xy-plane (\theta = 90°)')
rlim([rmin D0_dB+3])

sgtitle(sprintf('Patch array: N = %d, d = %.2f\\lambda, \\theta_0 = %d°, D_0 = %.2f dBi', ...
    N, dspacing, theta0, D0_dB))



%% Report numbers: isotropic array factor vs. patch array (point 3.5)
theta_fine = -90:0.01:90;      % fine grid for the beamwidth

Efun_iso   = @(t,p) ArrayFactor(d, I, t, p);
Efun_patch = @(t,p) PatchElement(t, p, L, W, f0) .* ArrayFactor(d, I, t, p);

Umax_patch = max(abs(E_tot(:)).^2);

res_iso   = pattern_metrics(Efun_iso,   D0_iso, Umax_iso,   theta_null, theta_fine);
res_patch = pattern_metrics(Efun_patch, D0,     Umax_patch, theta_null, theta_fine);

fprintf('\n%-28s %12s %12s\n', '', 'isotropic', 'with patch')
fprintf('%-28s %9.2f dBi %9.2f dBi\n', 'Max. directivity (integral)', D0_iso_dB, D0_dB)
fprintf('%-28s %9.2f dBi %9.2f dBi\n', 'Max. directivity (cut)',      res_iso.Dmax, res_patch.Dmax)
fprintf('%-28s %10.2f deg %10.2f deg\n', 'Main beam direction',       res_iso.theta_peak, res_patch.theta_peak)
fprintf('%-28s %10.3f deg %10.3f deg\n', '3 dB beamwidth',            res_iso.hpbw, res_patch.hpbw)
fprintf('%-28s %9.1f dBi %9.1f dBi\n', 'Level at theta_null',         res_iso.D_null, res_patch.D_null)

%% Local function (must stay at the end of the script, R2016b or newer)
function r = pattern_metrics(Efun, D0, Umax, theta_null, theta_cut)
% Metrics in the phi = 90 deg plane (contains the array and the beam)
phi90 = 90*ones(size(theta_cut));
D_H   = 10*log10(D0 * abs(Efun(theta_cut, phi90)).^2 / Umax + eps);

[r.Dmax, im] = max(D_H);
r.theta_peak = theta_cut(im);

% 3 dB beamwidth with linear interpolation of the two crossings
lvl = r.Dmax - 3;
iL  = find(D_H < lvl & theta_cut < r.theta_peak, 1, 'last');
iR  = find(D_H < lvl & theta_cut > r.theta_peak, 1, 'first');
xL  = interp1(D_H(iL:iL+1), theta_cut(iL:iL+1), lvl);
xR  = interp1(D_H(iR-1:iR), theta_cut(iR-1:iR), lvl);
r.hpbw = xR - xL;

% Absolute level at the null direction
r.D_null = 10*log10(D0 * abs(Efun(theta_null, 90)).^2 / Umax + eps);
end

%% Export tables of d and I for the LaTeX appendix
amp   = abs(I) / max(abs(I));                  % amplitude, normalized to max = 1
phase = mod(rad2deg(angle(I)) + 180, 360) - 180;   % phase wrapped to [-180, 180)

fid = fopen('appendix_tables.tex', 'w');

% --- Table of element positions d ---
fprintf(fid, '\\begin{longtable}{cc}\n');
fprintf(fid, '\\caption{Element positions $d_n$ along the $y$-axis ($N=%d$, $d=%.1f\\lambda$).}\\label{tab:d_vector}\\\\\n', N, dspacing);
fprintf(fid, '\\toprule\nElement $n$ & $d_n$ ($\\lambda$) \\\\\n\\midrule\n\\endfirsthead\n');
fprintf(fid, '\\toprule\nElement $n$ & $d_n$ ($\\lambda$) \\\\\n\\midrule\n\\endhead\n');
fprintf(fid, '\\bottomrule\n\\endfoot\n');
for k = 1:N
    fprintf(fid, '%d & %.2f \\\\\n', k-1, d(k));
end
fprintf(fid, '\\end{longtable}\n\n');

% --- Table of excitation coefficients I ---
fprintf(fid, '\\begin{longtable}{ccc}\n');
fprintf(fid, '\\caption{Complex excitation coefficients $I_n$, amplitude normalized to the maximum.}\\label{tab:I_vector}\\\\\n');
fprintf(fid, '\\toprule\nElement $n$ & $|I_n|$ (linear) & $\\arg(I_n)$ ($^\\circ$) \\\\\n\\midrule\n\\endfirsthead\n');
fprintf(fid, '\\toprule\nElement $n$ & $|I_n|$ (linear) & $\\arg(I_n)$ ($^\\circ$) \\\\\n\\midrule\n\\endhead\n');
fprintf(fid, '\\bottomrule\n\\endfoot\n');
for k = 1:N
    fprintf(fid, '%d & %.4f & %.2f \\\\\n', k-1, amp(k), phase(k));
end
fprintf(fid, '\\end{longtable}\n');

fclose(fid);
fprintf('Wrote appendix_tables.tex\n');