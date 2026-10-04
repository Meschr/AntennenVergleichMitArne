clear; clc; close all;

%% Constants
c  = 3e8;       % speed of light
f0 = 3e9;       % resonance frequency
er = 2.33;      % relative permittivity of RT/duroid 5870
h  = 1.5e-3;    % substrate height

%% Patch dimensions (Exercise 1)
W    = c/(2*f0)*sqrt(2/(er+1));
eeff = (er+1)/2 + (er-1)/2*(1 + 12*h/W)^(-0.5);
Leff = c/(2*f0*sqrt(eeff));            % note: Balanis uses eeff here
dL   = 0.412*h * ((eeff+0.3)*(W/h+0.264)) / ((eeff-0.258)*(W/h+0.8));
L    = Leff - 2*dL;

fprintf('W = %.2f mm, L = %.2f mm, eeff = %.3f, dL = %.2f mm\n', W*1e3, L*1e3, eeff, dL*1e3);

%% Array properties
N = 51;
dspacing = 0.8;                      % spacing in wavelengths
n = 0:N-1;
d = n*dspacing;

dtheta = 0.5; dphi = 0.5;            % full-sphere grid for D0
theta_full = 0:dtheta:180;
phi_full   = 0:dphi:360-dphi;        % 360 excluded, otherwise phi = 0 is counted twice
[THE, PHI] = meshgrid(theta_full, phi_full);

%% Angles from the student IDs (Marcel: 34, Arne: 70)
theta0     = mod(34,30);             % main beam direction
% theta0 = 30;
theta_null = -mod(70,30);            % null direction: -10 deg

%% Excitation: steering + null placement (Schelkunoff)
u0     = sind(theta0);
u_null = sind(theta_null);

psi_null = 2*pi*dspacing*(u_null - u0);
z_null   = exp(1j*psi_null);

z_roots = exp(1j*2*pi*(1:N-1)/N);    % natural nulls of the uniform array
[~, k0] = min(abs(z_roots - z_null));
z_roots(k0) = z_null;                % move the closest one onto theta_null

A = fliplr(poly(z_roots));           % taper coefficients, A(n+1) for element n
I = A .* exp(-1j*2*pi*d*u0);         % taper + steering phase

%% Full-sphere patterns and directivity
AF_full = ArrayFactor(d, I, THE, PHI);
E_tot   = PatchElement(THE, PHI, L, W, f0) .* AF_full;

[D0_iso,   D0_iso_dB]   = Directivity(AF_full, theta_full, phi_full);
[D0_patch, D0_patch_dB] = Directivity(E_tot,   theta_full, phi_full);

Umax_iso   = max(abs(AF_full(:)).^2);
Umax_patch = max(abs(E_tot(:)).^2);

Efun_iso   = @(t,p) ArrayFactor(d, I, t, p);
Efun_patch = @(t,p) PatchElement(t, p, L, W, f0) .* ArrayFactor(d, I, t, p);

%% Directivity patterns in the principal planes through the main beam (3.3 and 3.4)
% H-plane: yz-plane (array axis + beam), x-axis = theta
% E-plane: plane through the beam orthogonal to the H-plane, x-axis = angle from beam
alpha_H = (-90:0.01:90) - theta0;    % theta = alpha_H + theta0 spans [-90, 90]
alpha_E =  -90:0.01:90;

cases = { 'Isotropic elements', Efun_iso,   D0_iso,   Umax_iso,   D0_iso_dB ; ...
          'Patch elements',     Efun_patch, D0_patch, Umax_patch, D0_patch_dB };
res = struct();

for c = 1:2
    [name, Efun, D0c, Umaxc, D0c_dB] = cases{c,:};

    rH = plane_metrics(Efun, D0c, Umaxc, theta0, alpha_H, 'H');
    rE = plane_metrics(Efun, D0c, Umaxc, theta0, alpha_E, 'E');
    rH.D_null = 10*log10(D0c*abs(Efun(theta_null, 90)).^2/Umaxc + eps);
    rH.theta_peak = alpha_H(rH.im) + theta0;
    res(c).H = rH; res(c).E = rE;

    figure('Name', name)
    hold on
    plot(alpha_H + theta0, rH.D, 'LineWidth', 1.3, ...
        'DisplayName', sprintf('H-plane (yz), HPBW = %.2f°', rH.hpbw))
    plot(alpha_E, rE.D, 'LineWidth', 1.3, ...
        'DisplayName', sprintf('E-plane (through beam), HPBW = %.1f°', rE.hpbw))
    yline(D0c_dB, '--k', sprintf('D_0 = %.2f dBi', D0c_dB), 'HandleVisibility', 'off')
    yline(-30, ':r', '-30 dBi', 'HandleVisibility', 'off')
    xline(theta_null, '--m', sprintf('\\theta_{null} = %d° (H-plane)', theta_null), ...
        'HandleVisibility', 'off')
    xlabel('\theta (deg) in H-plane  /  angle from main beam (deg) in E-plane')
    ylabel('D (dBi)')
    title(sprintf('%s: N = %d, d = %.1f\\lambda, \\theta_0 = %d°', name, N, dspacing, theta0))
    xlim([-90 90]); ylim([-60 D0c_dB+3])
    legend('Location', 'southwest'); grid on
end

%% Report numbers (3.5)
fprintf('\n%-26s %14s %14s\n', '', 'isotropic', 'with patch')
fprintf('%-26s %10.2f dBi %10.2f dBi\n', 'Max. directivity', D0_iso_dB, D0_patch_dB)
fprintf('%-26s %10.2f deg %10.2f deg\n', 'Main beam direction', res(1).H.theta_peak, res(2).H.theta_peak)
fprintf('%-26s %10.3f deg %10.3f deg\n', '3 dB beamwidth H-plane', res(1).H.hpbw, res(2).H.hpbw)
fprintf('%-26s %10.2f deg %10.2f deg\n', '3 dB beamwidth E-plane', res(1).E.hpbw, res(2).E.hpbw)
fprintf('%-26s %10.1f dBi %10.1f dBi\n', 'Level at theta_null', res(1).H.D_null, res(2).H.D_null)
fprintf('(-156.5 dBi = eps floor of 10*log10(x+eps), i.e. an exact null)\n')

%% Amplitude taper and phase distribution
A_norm = abs(A)/max(abs(A));

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
title('Phase part of the taper (null correction)'); grid on

subplot(3,1,3)
plot(n, rad2deg(unwrap(angle(I))), 'o-', 'LineWidth', 1.2, 'DisplayName', 'arg(I_n) total'); hold on
plot(n, rad2deg(-2*pi*d*u0), 's--', 'LineWidth', 1.2, 'DisplayName', 'steering phase only')
xlabel('Element n'); ylabel('Phase (deg)')
title('Total excitation phase'); legend show; grid on

%% 3D directivity pattern of the patch array
skip = 2;
TH = THE(1:skip:end, 1:skip:end);
PH = PHI(1:skip:end, 1:skip:end);
Et = E_tot(1:skip:end, 1:skip:end);

D_dB = 10*log10(D0_patch*abs(Et).^2/Umax_patch + eps);
dyn  = 30;
D_dB_clip = max(D_dB, D0_patch_dB - dyn);
R = D_dB_clip - (D0_patch_dB - dyn);

figure('Name', '3D directivity pattern')
surf(R.*sind(TH).*cosd(PH), R.*sind(TH).*sind(PH), R.*cosd(TH), D_dB_clip, ...
    'EdgeColor', 'none', 'FaceAlpha', 0.95)
axis equal; grid on
xlabel('x'); ylabel('y (array axis)'); zlabel('z (broadside)')
cb = colorbar; cb.Label.String = 'D (dBi)';
clim([D0_patch_dB - dyn, D0_patch_dB]); colormap turbo
camlight headlight; lighting gouraud; view(135, 25)
title(sprintf('Patch array: N = %d, d = %.1f\\lambda, \\theta_0 = %d°, D_0 = %.2f dBi', ...
    N, dspacing, theta0, D0_patch_dB))

%% Polar plots in the three coordinate planes (patch array)
rmin = D0_patch_dB - 40;
Dfun = @(t,p) max(10*log10(D0_patch*abs(Efun_patch(t,p)).^2/Umax_patch + eps), rmin);
ang = -180:0.1:180;

figure('Name', 'Polar plots', 'Position', [100 100 1300 420])
subplot(1,3,1)
polarplot(deg2rad(ang), Dfun(ang, zeros(size(ang))), 'LineWidth', 1.3)
title('xz-plane (\phi = 0°)')
ax = gca; ax.ThetaZeroLocation = 'top'; ax.ThetaDir = 'clockwise'; rlim([rmin D0_patch_dB+3])

subplot(1,3,2)
polarplot(deg2rad(ang), Dfun(ang, 90*ones(size(ang))), 'LineWidth', 1.3)
title('yz-plane (\phi = 90°, H-plane)')
ax = gca; ax.ThetaZeroLocation = 'top'; ax.ThetaDir = 'clockwise'; rlim([rmin D0_patch_dB+3])

phi_xy = 0:0.1:360;
subplot(1,3,3)
polarplot(deg2rad(phi_xy), Dfun(90*ones(size(phi_xy)), phi_xy), 'LineWidth', 1.3)
title('xy-plane (\theta = 90°)'); rlim([rmin D0_patch_dB+3])

%% Export tables of d and I for the LaTeX appendix
amp   = abs(I)/max(abs(I));
phase = mod(rad2deg(angle(I)) + 180, 360) - 180;

fid = fopen('appendix_tables.tex', 'w');
fprintf(fid, '\\begin{longtable}{cc}\n');
fprintf(fid, '\\caption{Element positions $d_n$ along the $y$-axis ($N=%d$, $d=%.1f\\lambda$).}\\label{tab:d_vector}\\\\\n', N, dspacing);
fprintf(fid, '\\toprule\nElement $n$ & $d_n$ ($\\lambda$) \\\\\n\\midrule\n\\endfirsthead\n');
fprintf(fid, '\\toprule\nElement $n$ & $d_n$ ($\\lambda$) \\\\\n\\midrule\n\\endhead\n');
fprintf(fid, '\\bottomrule\n\\endfoot\n');
for k = 1:N
    fprintf(fid, '%d & %.2f \\\\\n', k-1, d(k));
end
fprintf(fid, '\\end{longtable}\n\n');

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

%% Local function (must stay at the end of the script)
function r = plane_metrics(Efun, D0, Umax, theta0, alpha, plane)
% Directivity along a principal plane through the beam b = (0, sin theta0, cos theta0).
% 'H': rotation within the yz-plane, 'E': rotation towards the x-axis.
b = [0; sind(theta0); cosd(theta0)];
if plane == 'H'
    t = [0; cosd(theta0); -sind(theta0)];
else
    t = [1; 0; 0];
end
r_dir = b*cosd(alpha) + t*sind(alpha);
the = acosd(max(min(r_dir(3,:), 1), -1));
phi = atan2d(r_dir(2,:), r_dir(1,:));

r.D = 10*log10(D0*abs(Efun(the, phi)).^2/Umax + eps);
[r.Dmax, r.im] = max(r.D);

lvl = r.Dmax - 3;
iL = find(r.D < lvl & alpha < alpha(r.im), 1, 'last');
iR = find(r.D < lvl & alpha > alpha(r.im), 1, 'first');
if isempty(iL) || isempty(iR)
    r.hpbw = NaN;
else
    xL = interp1(r.D(iL:iL+1), alpha(iL:iL+1), lvl);
    xR = interp1(r.D(iR-1:iR), alpha(iR-1:iR), lvl);
    r.hpbw = xR - xL;
end
end