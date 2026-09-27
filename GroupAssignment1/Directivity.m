function [D0, D0_dB] = Directivity(AF, the, phi)
%DIRECTIVITY Numerically compute directivity of a given far-field pattern
%   via Balanis (2-16).
%
%   [D0, D0_dB] = Directivity(AF, the, phi)
%
%   Inputs:
%       AF  - complex (or real) far-field pattern evaluated on a full-
%             sphere grid, size length(phi) x length(the), matching
%             meshgrid(the, phi)
%       the - vector of theta sample points in degrees, 0 to 180
%       phi - vector of phi sample points in degrees, 0 to 360
%
%   Outputs:
%       D0    - directivity (linear)
%       D0_dB - directivity in dB

[THE, ~] = meshgrid(the, phi);

dtheta = mean(diff(the));
dphi   = mean(diff(phi));

U = abs(AF).^2;
Umax = max(U(:));

Prad = sum(sum( U .* sind(THE) )) * deg2rad(dtheta) * deg2rad(dphi);

D0 = 4*pi*Umax / Prad;
D0_dB = 10*log10(D0);

end