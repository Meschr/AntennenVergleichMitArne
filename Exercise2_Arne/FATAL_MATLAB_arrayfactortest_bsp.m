% freq = 100e6;
% c = physconst('LightSpeed');
% lam = c/freq;

N = 8;
d = 0.5;

pos = (0:N-1)*d;
ang = -90:90;
scanangle = 0;
w = steervec(pos, scanangle);  % 1×N
W = w.';                % N×1 (8×1)

af = arrayfactor(pos,ang,w);
afdb = mag2db(abs(af.'));

figure(1)
plot(ang,afdb)
xlabel('Angle (deg)')
ylabel('Array pattern (dB)')
ylim([-30 20])
title('Array Factor of Unsteered Uniform Linear Array')