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
scanAngleRad = deg2rad(scan_angle);
beta = 0;
k = (2*pi);
psi = beta + k*d* (cos(thetaRad) - cos(scanAngleRad)); 

AF = zeros(size(thetaRad));

for elementIndex = 1:(N - 1)
    AF = AF + exp(1i * (elementIndex-1) * psi);
end

AF = AF / N;

end
