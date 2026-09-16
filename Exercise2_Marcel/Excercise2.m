clc;
clear;
close all;

d = 0.5; %in wavelength
N = 8;   %antenna elements
scan_angle = 0;

fc = 3e9;
c = physconst("LightSpeed");
lambda = c/fc;

the = -90:1:90;   %elevation
phi = -180:1:180; %azimuth

[PHI, THE] = meshgrid(phi, the);

AF = ArrayFactor(d, N, THE, PHI, scan_angle);

AFdB = 20*log10(abs(AF) / max(abs(AF(:))) + eps);

%% with array factor of antenna toolbox

tb = ver;
isInstalled = any(strcmp({tb.Name}, 'Antenna Toolbox'));

if isInstalled
    disp('Antenna Toolbox is installed.');
else
    disp('Antenna Toolbox is not installed.');
end

elem = dipole("Length", lambda/2, "Width", lambda/100);
arr = linearArray("Element", elem, "NumElements", N, "ElementSpacing", d*lambda);

AF_toolbox = arrayFactor(arr, fc, phi, the);
P = pattern(arr, fc, phi, the);

AF_toolbox_dB = 20*log10(abs(AF_toolbox) / max(abs(AF_toolbox(:))) + eps);

figure(1)
plot(THE,AFdB);
hold on
%plot(THE,AF_toolbox_dB);