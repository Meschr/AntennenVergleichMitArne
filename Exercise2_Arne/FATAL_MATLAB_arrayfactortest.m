% close all
% clear
% clc

d = 0.5;
N = 8;
% ULA positions (y-coordinates in wavelengths)
pos = (0:N-1)*d;        % 1-by-N

the = -90:90;         % elevation
phi = -180:180;      % azimuth

[PHI, THE] = meshgrid(phi, the);   % size length(the)-by-length(phi)

% Build 2-by-M angle matrix: each column [az; el]
ang = [PHI(:)'; THE(:)'];           % 2-by-M
% ang = [phi(:)'; the(:)'];

AF = arrayfactor(pos, ang);         % AF is 1-by-M (or 1-by-M-by-K for weights)
AFdB = mag2db(abs(AF.'));
% AFdB = 20*log10(abs(AF) / (max(abs(AF(:))) + eps));

% Reshape to grid for plotting as image/surface
AFdB_grid = reshape(AFdB, size(PHI));   % same size as PHI/THE

figure(2);
imagesc(phi, the, AFdB_grid);    % x=azimuth, y=elevation
set(gca,'YDir','normal')
caxis([-60 0]);                  % color limits
colormap(jet)
xlabel('Azimuth (deg)')
ylabel('Elevation (deg)')
title('Array Factor (dB)')
colorbar

figure(3)
plot(THE(:)',AFdB)