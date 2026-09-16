clc;
clear;
close all;

d = 0.5; %in wavelength
N = 5;   %antenna elements
scan_angle = 0;

fc = 3e9;
c = physconst("LightSpeed");
lambda = c/fc;

the = -180:1:180; %elevation
phi = 0:1:0; %azimuth

[PHI, THE] = meshgrid(phi, the);

AF = ArrayFactor(d, N, THE, PHI, scan_angle);

AFdB = 20*log10(abs(AF));

figure(1)
plot(THE,AFdB);
hold on