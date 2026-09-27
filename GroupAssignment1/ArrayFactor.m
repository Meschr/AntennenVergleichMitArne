function AF = ArrayFactor(d, I, the, phi)
%ARRAYFACTOR Analytical array factor for N elements arranged along the y-axis.
%
%   AF = ArrayFactor(d, I, the, phi)
%
%   Inputs:
%       d   - 1xN (or Nx1) vector: position of each element along the
%             y-axis, expressed as a fraction of the wavelength
%             (e.g. d = [0 0.5 1.0 1.5 ...] for uniform lambda/2 spacing)
%       I   - 1xN (or Nx1) complex-valued vector: excitation coefficient
%             of each element (amplitude and phase of the feed)
%       the - vector/matrix of theta values in degrees at which to
%             evaluate the far-field pattern
%       phi - vector/matrix of phi values in degrees at which to
%             evaluate the far-field pattern (same size as `the`)
%
%   Output:
%       AF  - complex array factor evaluated at each (the, phi) pair,
%             same size as `the`/`phi`

thetaRad = deg2rad(the);
phiRad   = deg2rad(phi);
k = (2*pi);

% Richtungskosinus entlang der y-Achse (Array-Achse)
u = sin(thetaRad) .* sin(phiRad);

AF = zeros(size(u));
for n = 1:length(I)
  AF = AF + I(n) .* exp(1i.*k.*d(n).*u);
end

end