function AF = ArrayFactor(d, N, the, phi, scan_angle)
%ARRAYFACTOR Compute the far-field array factor of a uniform linear array.
%
%   AF = ArrayFactor(d, N, the, phi, scan_angle) returns the array factor
%   for an N-element array arranged uniformly along the x-axis.
%
%   Inputs:
%       d           - Element spacing as a fraction of the wavelength
%       N           - Number of array elements
%       the         - Polar angle values theta in degrees
%       phi         - Azimuth angle values phi in degrees
%       scan_angle  - Scan angle of the main beam in degrees
%
%   Output:
%       AF          - Array factor evaluated over the requested angles
%
%   TODO: Implement the core array-factor computation.

thetaRad = deg2rad(the);
phiRad   = deg2rad(phi);
scanAngleRad = deg2rad(scan_angle);
beta = 0;
k = (2*pi);

% Richtungskosinus entlang der x-Achse (Array-Achse), Az/El-Konvention:
u = sin(thetaRad) .* cos(phiRad);   % the = el, phi = az

psi = beta + k*d* (u - sin(scanAngleRad)); 

AF = zeros(size(thetaRad));

for elementIndex = 1:N
    AF = AF + exp(1i * (elementIndex-1) * psi);
end

%AF = AF / N; 

end
