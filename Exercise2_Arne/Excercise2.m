clc;
clear;
close all;

d = 0.5;
N = 8;
scan_angle = 0;

the = -90:90;
phi = -180:180;

[PHI, THE] = meshgrid(phi, the);

% af = arrayfactor(pos,ang);
AF = ArrayFactor(d, N, THE, PHI, scan_angle);

% AFdB = 20*log10( abs(AF) / (max(abs(AF(:))) + eps) );
AFdB = mag2db(abs(AF.'));

figure(2)
plot(the,AFdB)
xlabel('Angle (deg)')
ylabel('Array pattern (dB)')
ylim([-30 20])
title('Array Factor of Unsteered Uniform Linear Array')