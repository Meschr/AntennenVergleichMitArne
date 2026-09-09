clc;
clear;
close all;

d = 0.5;
N = 8;
scan_angle = 0;

the = -90:1:90;
phi = -180:1:180;

[PHI, THE] = meshgrid(phi, the);

AF = ArrayFactor(d, N, THE, PHI, scan_angle);

AFdB = 20*log10(abs(AF) / max(abs(AF(:))) + eps);

figure(scan_angle)
surf(PHI, THE, AFdB, 'EdgeColor', 'none')
xlabel('\phi (deg)')
ylabel('\theta (deg)')
zlabel('Array Factor (dB)')
title('Array Factor Pattern')
colorbar
view(2)
shading interp
