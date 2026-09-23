clear;
clc;
close all;

%% =========================================================
%  PATCH ANTENNA PARAMETERS
%  ==========================================================

c  = 3e8;
f0 = 3e9;
er = 2.33;
h  = 1.5e-3;              % substrate thickness

% Patch width
W = c/(2*f0)*sqrt(2/(er+1));

% Effective permittivity
eeff = (er+1)/2 + ...
       (er-1)/2*(1 + 12*h/W)^(-0.5);

% Effective length
Leff = c/(2*f0*sqrt(eeff));

% Fringing extension
dL = 0.412*h * ...
    ((eeff+0.3)*(W/h+0.264)) / ...
    ((eeff-0.258)*(W/h+0.8));

% Physical patch length
L = Leff - 2*dL;

lambda0 = c/f0;
k0 = 2*pi/lambda0;

fprintf('Patch dimensions:\n');
fprintf('L = %.2f mm\n',L*1000);
fprintf('W = %.2f mm\n',W*1000);
fprintf('h = %.2f mm\n',h*1000);


%% =========================================================
%  3D RADIATION PATTERN
% ==========================================================

theta = 0:1:90;
phi   = 0:1:359;

[PHI,TH] = meshgrid(phi,theta);

th = deg2rad(TH);
ph = deg2rad(PHI);


%% General radiation equation

A = (k0*W/2).*sin(th).*sin(ph);

B = (k0*L/2).*sin(th).*cos(ph);


% sin(A)/A
Ef = ones(size(A));

idx = abs(A) > 1e-12;
Ef(idx) = sin(A(idx))./A(idx);


% Electric-field components

Etheta = Ef .* cos(ph);

Ephi = -Ef .* cos(th) .* sin(ph);


% Total electric field

E = sqrt(abs(Etheta).^2 + abs(Ephi).^2);


%% Normalize

E = E ./ max(E(:));

E_dB = 20*log10(E);

% Dynamic range
E_dB = max(E_dB,-40);


%% =========================================================
%  COORDINATES OF RADIATION PATTERN
% ==========================================================

% Scaling factor for visualization
pattern_scale = 40e-3;       % 40 mm

R = pattern_scale * E;

Xrad = R .* sin(th).*cos(ph);
Yrad = R .* sin(th).*sin(ph);
Zrad = R .* cos(th);

% Put radiation pattern above the patch
Zrad = Zrad + h;


%% =========================================================
%  CREATE FIGURE
% ==========================================================

figure('Color','w');

hold on;


%% =========================================================
%  SUBSTRATE
% ==========================================================

% Coordinates
x1 = -L/2;
x2 =  L/2;

y1 = -W/2;
y2 =  W/2;

z1 = 0;
z2 = h;

% Vertices
V = [
    x1 y1 z1
    x2 y1 z1
    x2 y2 z1
    x1 y2 z1
    x1 y1 z2
    x2 y1 z2
    x2 y2 z2
    x1 y2 z2
];

% Faces
F = [
    1 2 3 4       % bottom
    5 6 7 8       % top
    1 2 6 5       % side
    2 3 7 6
    3 4 8 7
    4 1 5 8
];

patch('Vertices',V,...
      'Faces',F,...
      'FaceAlpha',0.25,...
      'EdgeColor','k');


%% =========================================================
%  METAL PATCH
% ==========================================================

Xp = [-L/2  L/2  L/2 -L/2];
Yp = [-W/2 -W/2 W/2 W/2];
Zp = [h h h h];

patch(Xp,Yp,Zp,...
      'FaceAlpha',0.9,...
      'EdgeColor','k');


%% =========================================================
%  FEED LINE
% ==========================================================

feed_length = 15e-3;

Xfeed = [-L/2-feed_length  -L/2];
Yfeed = [0 0];
Zfeed = [h h];

plot3(Xfeed,Yfeed,Zfeed,...
      'LineWidth',4);


%% =========================================================
%  RADIATION PATTERN
% ==========================================================

surf(Xrad,Yrad,Zrad,E_dB,...
     'EdgeColor','none',...
     'FaceAlpha',0.75);


%% =========================================================
%  ANTENNA / RADIATION CENTER
% ==========================================================

plot3(0,0,h,...
      'o',...
      'MarkerSize',7,...
      'MarkerFaceColor','k');


%% =========================================================
%  COORDINATE SYSTEM
% ==========================================================

quiver3(0,0,h,...
        15e-3,0,0,...
        'LineWidth',1.5);

quiver3(0,0,h,...
        0,15e-3,0,...
        'LineWidth',1.5);

quiver3(0,0,h,...
        0,0,15e-3,...
        'LineWidth',1.5);


%% =========================================================
%  LABELS
% ==========================================================

xlabel('x [m]');
ylabel('y [m]');
zlabel('z [m]');

title('3D Radiation Pattern of Rectangular Patch Antenna');

axis equal;
grid on;

view(35,25);

colorbar;
caxis([-40 0]);

colormap jet;

hold off;