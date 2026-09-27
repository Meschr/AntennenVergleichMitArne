%% Directivity_Pattern.m
% Plot the actual directivity pattern D(theta,phi) in dB for ONE scan
% angle — scaled by the real D0 (from numerical integration), not just
% normalized to an arbitrary 0 dB peak.

clc; clear; close all;

N = 51;
dspacing = 0.8;
d = (0:N-1)*dspacing;

dtheta = 0.5;   % fine enough grid for a converged D0
dphi   = 0.5;

theta_full = 0:dtheta:180;
phi_full   = 0:dphi:360;
[THE, PHI] = meshgrid(theta_full, phi_full);

theta_cut = -180:0.5:180;   % for the 2D cartesian cut plot
planes = [90 0];
planeNames = {'\phi = 90° (contains array)', '\phi = 0° (perpendicular)'};


%%Compute angle based on modulo of student id
%Arne: 70
%Marcel: 34

theta0 = mod(34,30);   %scan angle
I = exp(-1i*2*pi*d*sin(deg2rad(theta0)));

%% Full-sphere pattern -> D0 for this excitation
AF_full = ArrayFactor(d, I, THE, PHI);
[D0, D0_dB] = Directivity(AF_full, theta_full, phi_full);

%% Directivity pattern along the two cuts, scaled by D0
figure('Name', sprintf('Directivity pattern, scan angle = %d deg', theta0))
hold on
for p = 1:2
    phi_line = planes(p)*ones(size(theta_cut));
    AF_cut = ArrayFactor(d, I, theta_cut, phi_line);

    U_norm = abs(AF_cut).^2 / max(abs(AF_full(:)).^2);   % normalize to SAME peak as full sphere
    D_pattern_dB = 10*log10(D0 * U_norm + eps);           % actual directivity, in dB

    plot(theta_cut, D_pattern_dB, 'LineWidth', 1.2, 'DisplayName', planeNames{p})
end
yline(D0_dB, '--k', sprintf('D_0 = %.2f dB', D0_dB), 'DisplayName', 'D_0 (peak)')
xlabel('\theta (deg)'); ylabel('D(\theta,\phi) (dBi)')
title(sprintf('N = %d, scan angle \\theta_0 = %d°, D_0 = %.2f dB', N, theta0, D0_dB))
xlim([-180 180])
legend show; grid on


%% E-plane and H-plane directivity pattern (theta in [-90, 90] deg) — Aufgabe 3.2
theta_cut90 = -90:0.5:90;

figure('Name', sprintf('E-/H-plane, N=%d, scan angle=%d deg', N, theta0))
hold on
for p = 1:2
    phi_line = planes(p)*ones(size(theta_cut90));
    AF_cut90 = ArrayFactor(d, I, theta_cut90, phi_line);

    U_norm90 = abs(AF_cut90).^2 / max(abs(AF_full(:)).^2);
    D_pattern90_dB = 10*log10(D0 * U_norm90 + eps);

    plot(theta_cut90, D_pattern90_dB, 'LineWidth', 1.2, 'DisplayName', planeNames{p})
end
yline(D0_dB, '--k', sprintf('D_0 = %.2f dB', D0_dB), 'DisplayName', 'D_0 (Peak)')
xlabel('\theta (deg)'); ylabel('D(\theta,\phi) (dBi)')
title(sprintf('E-/H-plane: N = %d, \\theta_0 = %d°, D_0 = %.2f dBi', N, theta0, D0_dB))
xlim([-90 90])
legend show; grid on

%% Null-Steering zusätzlich zur Hauptkeulen-Steuerung
YY = mod(70, 30);        % Arne's ID, >35 -> mod 30
theta_null = -YY;        % -10 deg

u0 = sind(theta0);           % Hauptkeule (bereits vorhanden: theta0 = mod(34,30))
u_null = sind(theta_null);

n = 0:N-1;
d = n*dspacing;

psi_null = 2*pi*dspacing*(u_null - u0);
z_null = exp(1j*psi_null);

% Natürliche Nullstellen der uniformen Anregung
k = 1:N-1;
z_natural = exp(1j*2*pi*k/N);

% Die dem gewünschten Null am nächsten liegende natürliche Nullstelle ersetzen
[~, k0] = min(abs(z_natural - z_null));
z_natural(k0) = z_null;

% Amplitudentaper aus den (modifizierten) Nullstellen rekonstruieren
p_new = poly(z_natural);      % absteigende Potenzen
A = fliplr(p_new);            % A(n+1) = Amplitude von Element n

% Finale Anregung: Taper + Steuerphase
I = A .* exp(-1j*2*pi*d*u0);

%% Verifikation
AF_full = ArrayFactor(d, I, THE, PHI);
[D0, D0_dB] = Directivity(AF_full, theta_full, phi_full);

AF_null = ArrayFactor(d, I, theta_null, 90);
AF_null_dB = 10*log10(abs(AF_null)^2/max(abs(AF_full(:)).^2) + eps);

fprintf('D0 = %.2f dBi (Ziel: >= 19)\n', D0_dB)
fprintf('Pegel bei theta_null = %d°: %.2f dB relativ zum Peak (Ziel: <= -30)\n', theta_null, AF_null_dB)%% Directivity pattern along the two cuts, scaled by D0

%% Pattern plot mit markierter Nullstelle
theta_cut = -180:0.1:180;   % feine Auflösung, damit die Nullstelle scharf sichtbar ist
planes = [90 0];
planeNames = {'\phi = 90° (enthält Array)', '\phi = 0° (senkrecht)'};

figure('Name', sprintf('Null-Steering: N=%d, scan=%d°, null=%d°', N, theta0, theta_null))
hold on
for p = 1:2
    phi_line = planes(p)*ones(size(theta_cut));
    AF_cut = ArrayFactor(d, I, theta_cut, phi_line);

    U_norm = abs(AF_cut).^2 / max(abs(AF_full(:)).^2);
    D_pattern_dB = 10*log10(D0 * U_norm + eps);

    plot(theta_cut, D_pattern_dB, 'LineWidth', 1.2, 'DisplayName', planeNames{p})
end

yline(D0_dB, '--k', sprintf('D_0 = %.2f dB', D0_dB), 'DisplayName', 'D_0 (Peak)')
yline(D0_dB - 30, ':r', '-30 dB rel. zum Peak', 'DisplayName', 'Ziel-Nullpegel')
xline(theta_null, '--m', sprintf('\\theta_{null} = %d°', theta_null), 'DisplayName', 'Geforderte Nullstelle')

xlabel('\theta (deg)'); ylabel('D(\theta,\phi) (dBi)')
title(sprintf('N=%d, \\theta_0=%d°, \\theta_{null}=%d°, D_0=%.2f dBi', N, theta0, theta_null, D0_dB))
xlim([-180 180])
legend show; grid on