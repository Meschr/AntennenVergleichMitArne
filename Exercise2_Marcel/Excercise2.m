clc;
clear;
close all;

d = 0.1;
N = 80;
scan_angle = 0;

the = -90:1:90;
phi = -180:1:180;

[PHI, THE] = meshgrid(phi, the);

AF = ArrayFactor(d, N, THE, PHI, scan_angle);

AFdB = 20*log10(abs(AF) / max(abs(AF(:))) + eps);

figure(1)
imagesc(AFdB) 

figure(2)
plot(THE,AFdB);