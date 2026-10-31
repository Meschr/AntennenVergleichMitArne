function AF = ArrayFactor(d, N, THE, PHI, scan_angle)
    % THE, PHI from meshgrid (degrees)
    the = deg2rad(THE);           % convert matrix to radians
    beta = 0;
    k = 2*pi;
    psi = beta + k * d .* cos(the);   % same size as THE

    n = (1:(N)).';             % N×1
    psi_vec = psi(:).';          % 1×M where M = numel(THE)

    AF_vec = (1/N) * sum(exp(1i * ((n-1) * psi_vec)), 1);  % 1×M
    AF = reshape(AF_vec, size(THE));                   % back to THE size
end
