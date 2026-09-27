%% Directivity_Optimize_N_and_Spacing.m
% Findet die minimale Elementzahl N UND die zugehörige Spacing, mit der
% mindestens 19 dBi Directivity in Hauptstrahlrichtung erreicht wird.
% Idee: bei größerer Spacing wächst die effektive Apertur pro Element ->
% potenziell weniger N nötig. Ab einer gewissen Spacing entstehen aber
% Grating Lobes, die die Peak-Directivity wieder einbrechen lassen.
% Deshalb wird über einen Spacing-Bereich gesucht, nicht nur über N.

clc; clear; close all;

%% Grobe Suche: schnelleres Grid, um viele (Spacing, N)-Kombinationen zu testen
dtheta_search = 1;
dphi_search   = 1;
theta_search = 0:dtheta_search:180;
phi_search   = 0:dphi_search:360;
[THE_s, PHI_s] = meshgrid(theta_search, phi_search);

theta0 = mod(34,30);      % Scan-Winkel, fix (Studenten-ID)
D0_target = 19;           % dBi, geforderter Mindestwert
maxN = 300;               % Sicherheitsgrenze pro Spacing

spacings = 0.3:0.05:1.2;  % zu testender Spacing-Bereich, in Wellenlängen
N_needed = nan(size(spacings));

for si = 1:length(spacings)
    dspacing = spacings(si);
    N = 0;
    D0_dB = -Inf;
    while D0_dB < D0_target && N < maxN
        N = N + 1;
        d = (0:N-1)*dspacing;
        I = exp(-1i*2*pi*d*sin(deg2rad(theta0)));
        AF_full = ArrayFactor(d, I, THE_s, PHI_s);
        [~, D0_dB] = Directivity(AF_full, theta_search, phi_search);
    end
    if D0_dB >= D0_target
        N_needed(si) = N;
    end
    fprintf('Spacing = %.2f lambda -> minimales N = %s (D0 = %.2f dBi)\n', ...
        dspacing, mat2str(N_needed(si)), D0_dB);
end

%% Beste Kombination auswählen
[N_min, idx_best] = min(N_needed);
dspacing_best = spacings(idx_best);
fprintf('\nBeste Kombination: Spacing = %.2f lambda, N = %d\n', dspacing_best, N_min);

%% Trend plotten
figure
plot(spacings, N_needed, 'o-', 'LineWidth', 1.2)
xlabel('Element spacing (\lambda)')
ylabel('Minimales N für D_0 \geq 19 dBi')
title('Minimale Elementzahl vs. Spacing')
grid on

%% Finale, hochaufgelöste Berechnung für die beste Kombination
dtheta = 0.5; dphi = 0.5;
theta_full = 0:dtheta:180;
phi_full   = 0:dphi:360;
[THE, PHI] = meshgrid(theta_full, phi_full);

d = (0:N_min-1)*dspacing_best;
I = exp(-1i*2*pi*d*sin(deg2rad(theta0)));
AF_full = ArrayFactor(d, I, THE, PHI);
[D0, D0_dB] = Directivity(AF_full, theta_full, phi_full);

%% Pattern für die beste Kombination plotten
theta_cut = -180:0.5:180;
planes = [90 0];
planeNames = {'\phi = 90° (enthält Array)', '\phi = 0° (senkrecht)'};

figure('Name', sprintf('Optimiert: N=%d, spacing=%.2f, scan=%d deg', N_min, dspacing_best, theta0))
hold on
for p = 1:2
    phi_line = planes(p)*ones(size(theta_cut));
    AF_cut = ArrayFactor(d, I, theta_cut, phi_line);
    U_norm = abs(AF_cut).^2 / max(abs(AF_full(:)).^2);
    D_pattern_dB = 10*log10(D0 * U_norm + eps);
    plot(theta_cut, D_pattern_dB, 'LineWidth', 1.2, 'DisplayName', planeNames{p})
end
yline(D0_dB, '--k', sprintf('D_0 = %.2f dB', D0_dB), 'DisplayName', 'D_0 (Peak)')
xlabel('\theta (deg)'); ylabel('D(\theta,\phi) (dBi)')
title(sprintf('Optimiert: N=%d, d=%.2f\\lambda, \\theta_0=%d°, D_0=%.2f dBi', N_min, dspacing_best, theta0, D0_dB))
xlim([-180 180])
legend show; grid on