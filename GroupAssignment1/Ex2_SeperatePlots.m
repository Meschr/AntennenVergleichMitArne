clc; clear; close all;

N = 15;
dspacing = 0.5;
d = (0:N-1)*dspacing;

theta = -180:0.5:180;
scan_angles = [0 30 60 90];
planes = [90 0];
planeNames = {'\phi = 90° (contains array)', '\phi = 0° (perpendicular)'};

%% Scan angle = 0°
theta0 = scan_angles(1);
figure('Name', sprintf('Scan angle = %d deg', theta0))
I = exp(-1i*2*pi*d*sin(deg2rad(theta0)));
hold on
for p = 1:2
    phi = planes(p)*ones(size(theta));
    AF = ArrayFactor(d, I, theta, phi);
    AFdB = 20*log10(abs(AF));
    plot(theta, AFdB, 'LineWidth', 1.2, 'DisplayName', planeNames{p})
end
xlabel('\theta (deg)'); ylabel('AF (dB)')
title(sprintf('N = %d, scan angle \\theta_0 = %d°', N, theta0))
%ylim([-40 0]); xlim([-180 180])
legend show; grid on

%% Scan angle = 30°
theta0 = scan_angles(2);
figure('Name', sprintf('Scan angle = %d deg', theta0))
I = exp(-1i*2*pi*d*sin(deg2rad(theta0))); 
hold on
for p = 1:2
    phi = planes(p)*ones(size(theta));
    AF = ArrayFactor(d, I, theta, phi);
    AFdB = 20*log10(abs(AF));
    plot(theta, AFdB, 'LineWidth', 1.2, 'DisplayName', planeNames{p})
end
xlabel('\theta (deg)'); ylabel('AF (dB)')
title(sprintf('N = %d, scan angle \\theta_0 = %d°', N, theta0))
ylim([-40 0]); xlim([-180 180])
legend show; grid on

%% Scan angle = 60°
theta0 = scan_angles(3);
figure('Name', sprintf('Scan angle = %d deg', theta0))
I = exp(-1i*2*pi*d*sin(deg2rad(theta0)));
hold on
for p = 1:2
    phi = planes(p)*ones(size(theta));
    AF = ArrayFactor(d, I, theta, phi);
    AFdB = 20*log10(abs(AF));
    plot(theta, AFdB, 'LineWidth', 1.2, 'DisplayName', planeNames{p})
end
xlabel('\theta (deg)'); ylabel('AF (dB)')
title(sprintf('N = %d, scan angle \\theta_0 = %d°', N, theta0))
%ylim([-40 0]); xlim([-180 180])
legend show; grid on

%% Scan angle = 90°
theta0 = scan_angles(4);
figure('Name', sprintf('Scan angle = %d deg', theta0))
I = exp(-1i*2*pi*d*sin(deg2rad(theta0)));
hold on
for p = 1:2
    phi = planes(p)*ones(size(theta));
    AF = ArrayFactor(d, I, theta, phi);
    AFdB = 20*log10(abs(AF));
    plot(theta, AFdB, 'LineWidth', 1.2, 'DisplayName', planeNames{p})
end
xlabel('\theta (deg)'); ylabel('AF (dB)')
title(sprintf('N = %d, scan angle \\theta_0 = %d°', N, theta0))
%ylim([-40 0]); xlim([-180 180])
legend show; grid on