%% Directivity_Pattern.m
% Plot the actual directivity pattern D(theta,phi) in dB — i.e. scaled
% by the real D0 (from numerical integration), not just normalized to
% an arbitrary 0 dB peak.

clc; clear; close all;

N = 15;
dspacing = 0.5;
d = (0:N-1)*dspacing;

dtheta = 0.5;   % fine enough grid for a converged D0
dphi   = 0.5;

theta_full = 0:dtheta:180;
phi_full   = 0:dphi:360;
[THE, PHI] = meshgrid(theta_full, phi_full);

theta_cut = -180:0.5:180;   % for the 2D cartesian cut plots
planes = [90 0];
planeNames = {'\phi = 90° (contains array)', '\phi = 0° (perpendicular)'};
scan_angles = [0 30 60 90];

for s = 1:length(scan_angles)
    theta0 = scan_angles(s);
    I = exp(-1i*2*pi*d*sin(deg2rad(theta0)));

    %% Full-sphere pattern -> D0 for THIS excitation
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
end