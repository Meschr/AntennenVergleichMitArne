clear all; close all; clc;

load BL206_FF_Data_ETheta_EPhi.mat

% [phi, data, freq]

%% Angular and frequency data
phi = (data.axes(1).data).*(180/pi);    % deg
theta = (data.axes(2).data).*(180/pi);  % deg
freq = (data.axes(3).data);             % Hz

[THE, PHI] = meshgrid(theta.*(pi/180), phi.*(pi/180)); % rad

%% Field data
Ethe_real = data.layers(1).data;
Ethe_imag = data.layers(2).data;
Ethe = Ethe_real + 1j.*(Ethe_imag);
Ephi_real = data.layers(3).data;
Ephi_imag = data.layers(4).data;
Ephi = Ephi_real + 1j.*(Ephi_imag);

%% Find indeces of E and H planes
phi_00 = 1;
phi_90 = find(abs(phi-90)<1e-5);

%% Polarization offset of co-pol
phi0 = 0.*(pi/180);      % rad

%% Plot 3 frequencies
figure(1); hold on; grid on;
figure(2); hold on; grid on;
for ii = 1:4:numel(freq)
    fr = freq(ii)/1e9;
    E0 = squeeze(Ethe(:,:,ii));
    E1 = squeeze(Ephi(:,:,ii));
    Eco = E0.*cos(PHI-phi0) - E1.*sin(PHI-phi0);
    Ecx = E0.*sin(PHI-phi0) + E1.*cos(PHI-phi0);
    figure(1); plot(theta, 20*log10(abs(Eco(phi_00, :))), 'LineWidth',1.5, 'DisplayName', ['Co-polar, f = ', num2str(fr), ' GHz'])
    figure(1); plot(theta, 20*log10(abs(Ecx(phi_00, :))), '--','LineWidth',1.0, 'DisplayName', ['Cx-polar, f = ', num2str(fr), ' GHz'])
    figure(2); plot(theta, 20*log10(abs(Eco(phi_90, :))), 'LineWidth',1.5, 'DisplayName', ['Co-polar, f = ', num2str(fr), ' GHz'])
    figure(2); plot(theta, 20*log10(abs(Ecx(phi_90, :))), '--','LineWidth',1.0, 'DisplayName', ['Cx-polar, f = ', num2str(fr), ' GHz'])
end
figure(1);
title('\phi = 0 plane cut');
xlabel('Theta [deg]');          xlim([theta(1) theta(end)]);
ylabel('Directivity [dBi]');    ylim([-40 20]);
legend show;
figure(2);
title('\phi = 90 plane cut');
xlabel('Theta [deg]');          xlim([theta(1) theta(end)]);
ylabel('Directivity [dBi]');    ylim([-40 20]);
legend show;