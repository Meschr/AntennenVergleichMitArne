function E = PatchElement(the, phi, L, W, f0)
%PATCHELEMENT Feldbetrag |E| eines Patch-Elements (Zwei-Schlitz-Modell).
%   E = PatchElement(the, phi, L, W, f0)
%
%   the, phi - Winkel in Grad (gleiche Größe), theta von der z-Achse
%   L, W     - Patch-Länge (x-Richtung) und -Breite (y-Richtung) in m
%   f0       - Frequenz in Hz
%
%   E-Ebene: phi = 0 deg, H-Ebene: phi = 90 deg.
%   Halbraum: Groundplane -> Feld = 0 für |theta| > 90 deg.

c  = 3e8;
k0 = 2*pi*f0/c;

th = deg2rad(the);
ph = deg2rad(phi);

X = (k0*L/2) .* sin(th) .* cos(ph);
Y = (k0*W/2) .* sin(th) .* sin(ph);

sincY = ones(size(Y));
idx = abs(Y) > 1e-12;
sincY(idx) = sin(Y(idx)) ./ Y(idx);

F = cos(X) .* sincY;

Eth = cos(ph) .* F;
Eph = cos(th) .* sin(ph) .* F;

E = sqrt(abs(Eth).^2 + abs(Eph).^2);
E(abs(the) > 90) = 0;      % Rückseite abgeschirmt
end