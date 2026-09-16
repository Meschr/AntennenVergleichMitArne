clc; clear; %close all;

%% Parameters
d = 0.5;            % element spacing in wavelengths
N = 8;              % number of elements
scan_angle = 90;    % broadside (matches unphased toolbox array)
fc = 3e9;
c = physconst("LightSpeed");
lambda = c/fc;

the = -90:1:90;    % elevation
phi = -180:1:180;  % azimuth
[PHI, THE] = meshgrid(phi, the);

%% Own array factor
AF = ArrayFactor(d, N, THE, PHI, scan_angle);
AFdB = 20*log10(abs(AF)/max(abs(AF(:))) + eps);

%% Toolbox array factor
elem = dipole("Length", lambda/2, "Width", lambda/100);
arr  = linearArray("Element", elem, "NumElements", N, "ElementSpacing", d*lambda);

AF_tb_dB = arrayFactor(arr, fc, phi, the);   % (az, el) = (phi, the) — already in dB, unnormalized
AF_tb_dB = AF_tb_dB - max(AF_tb_dB(:));      % normalize by SUBTRACTION, not another log

%% Compare
figure
subplot(1,3,1)
contourf(PHI, THE, AFdB, 20, 'LineColor','none')
xlabel('\phi (az)'); ylabel('\theta (el)'); title('Eigene Funktion')
colorbar; clim([-40 0])

subplot(1,3,2)
contourf(PHI, THE, AF_tb_dB, 20, 'LineColor','none')
xlabel('\phi (az)'); ylabel('\theta (el)'); title('Antenna Toolbox')
colorbar; clim([-40 0])

subplot(1,3,3)
diffdB = AFdB - AF_tb_dB;
contourf(PHI, THE, diffdB, 20, 'LineColor','none')
xlabel('\phi (az)'); ylabel('\theta (el)'); title('Differenz (dB)')
colorbar

fprintf('Max. Abweichung: %.2e dB\n', max(abs(diffdB(:))))