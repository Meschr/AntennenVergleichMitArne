clc; clear; %close all;

%% Parameters
d = 0.5;            % element spacing in wavelengths
N = 8;              % number of elements
scan_angle = 70;  
fc = 3e9;
c = physconst("LightSpeed");
lambda = c/fc;

the = -90:1:90;    % elevation
phi = -180:1:180;  % azimuth
[PHI, THE] = meshgrid(phi, the);

%% Own array factor
AF = ArrayFactor(d, N, THE, PHI, scan_angle);
AFdB = 20*log10(abs(AF)/max(abs(AF(:))) + eps);


%% Compare
figure(1)
contourf(PHI, THE, AFdB, 20, 'LineColor','none')
xlabel('\phi (az)'); ylabel('\theta (el)'); title('Eigene Funktion')
colorbar; clim([-40 0])