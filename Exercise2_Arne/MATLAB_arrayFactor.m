
% Example using Antenna Toolbox arrayFactor for an 8-element ULA
N = 8;
d = 0.5;               % spacing in wavelengths
freq = 3e8;            % Hz (choose freq so lambda = c/freq)
c = 3e8;
lambda = c/freq;

la = linearArray('NumElements',N,'ElementSpacing',d*lambda);

az = -180:1:180;       % azimuth (deg)
el = -90:1:90;         % elevation (deg)

[AF,AZ,EL] = arrayFactor(la,freq,az,el);   % AF returned as MxK or PxMxK
AF = squeeze(AF);                          % ensure 2D: length(el)×length(az)

AFdB = 20*log10(abs(AF) ./ (max(abs(AF(:))) + eps));

figure(3)
plot(az,AFdB)
xlabel('Angle (deg)')
ylabel('Array pattern (dB)')
ylim([-30 20])
title('Array Factor of Unsteered Uniform Linear Array')

% figure;
% imagesc(az, el, AFdB);
% set(gca,'YDir','normal')
% caxis([-60 0]);
% colormap(jet);
% xlabel('Azimuth (deg)');
% ylabel('Elevation (deg)');
% title('Array Factor (dB)');
% colorbar;