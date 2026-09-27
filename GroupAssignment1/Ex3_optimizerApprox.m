%% Directivity_Optimize_Balanis_Check.m
% Findet minimales N für D0 >= Ziel-dBi, per (a) schneller analytischer
% Schätzung über Balanis (6-42), (b) exakter numerischer Verifikation.

clc; clear; close all;

theta0 = mod(34,30);      % Scan-Winkel (Studenten-ID)
D0_target_dB = 19;        % dBi
D0_target_lin = 10^(D0_target_dB/10);

spacings = 0.3:0.05:1.2;  % zu testender Spacing-Bereich, in Wellenlängen

dtheta = 0.5; dphi = 0.5;
theta_full = 0:dtheta:180;
phi_full   = 0:dphi:360;
[THE, PHI] = meshgrid(theta_full, phi_full);

fprintf('%-10s %-12s %-14s %-14s %-10s\n', 'Spacing', 'N (Balanis)', 'D0_approx(dB)', 'D0_numeric(dB)', 'Diff(dB)')

N_needed_numeric = nan(size(spacings));
N_needed_approx  = nan(size(spacings));

for si = 1:length(spacings)
    dspacing = spacings(si);

    %% (a) Analytische Schätzung nach Balanis (6-42), sofort, ohne Integration
    N_approx = ceil( D0_target_lin / (2*dspacing*cosd(theta0)) );
    D0_approx_dB = 10*log10( 2*N_approx*dspacing*cosd(theta0) );

    %% (b) Numerische Verifikation bei diesem N
    d = (0:N_approx-1)*dspacing;
    I = exp(-1i*2*pi*d*sin(deg2rad(theta0)));
    AF_full = ArrayFactor(d, I, THE, PHI);
    [~, D0_numeric_dB] = Directivity(AF_full, theta_full, phi_full);

    N_needed_approx(si)  = N_approx;
    N_needed_numeric(si) = N_approx;   % Ausgangspunkt für Feinjustage unten

    fprintf('%-10.2f %-12d %-14.2f %-14.2f %-10.2f\n', ...
        dspacing, N_approx, D0_approx_dB, D0_numeric_dB, D0_numeric_dB - D0_approx_dB)
end

%% Feinjustage: falls die Approximation leicht daneben liegt, numerisch nachschärfen
fprintf('\n--- Feinjustage (numerisch exakt) ---\n')
for si = 1:length(spacings)
    dspacing = spacings(si);
    N = N_needed_approx(si);
    d = (0:N-1)*dspacing;
    I = exp(-1i*2*pi*d*sin(deg2rad(theta0)));
    AF_full = ArrayFactor(d, I, THE, PHI);
    [~, D0_dB] = Directivity(AF_full, theta_full, phi_full);

    % Balanis-Schätzung kann leicht daneben liegen -> hoch/runter korrigieren
    while D0_dB < D0_target_dB
        N = N + 1;
        d = (0:N-1)*dspacing;
        I = exp(-1i*2*pi*d*sin(deg2rad(theta0)));
        AF_full = ArrayFactor(d, I, THE, PHI);
        [~, D0_dB] = Directivity(AF_full, theta_full, phi_full);
    end
    N_needed_numeric(si) = N;
    fprintf('Spacing = %.2f: Balanis-N = %d -> numerisch korrigiertes N = %d (D0 = %.2f dBi)\n', ...
        dspacing, N_needed_approx(si), N, D0_dB)
end

[N_min, idx_best] = min(N_needed_numeric);
fprintf('\nBeste Kombination: Spacing = %.2f lambda, N = %d\n', spacings(idx_best), N_min);

figure
plot(spacings, N_needed_approx, 'o--', 'DisplayName', 'Balanis (6-42), analytisch'); hold on
plot(spacings, N_needed_numeric, 's-', 'DisplayName', 'Numerisch (exakt)')
xlabel('Element spacing (\lambda)'); ylabel('Minimales N für D_0 \geq 19 dBi')
legend show; grid on
title('Vergleich: analytische Näherung vs. numerische Integration')