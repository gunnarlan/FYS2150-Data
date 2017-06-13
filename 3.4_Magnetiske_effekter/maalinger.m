%% Eksperimenter diamagnetisme
% Utstyrsliste:
% Cocraft Vernier Caliper
% Vismutstang
% Presisjonsvekt

% CONSTANTS
mu0 = 4*pi*1e-7 % Hm^-1;

% LAMBDAS
err = @(x) sum(x.^2);

% Tversnittet A measured at several points along the length of the rod in
% terms of the radii
% Repeated 3 times
r = [0 0 0;  % Measured at:
     0 0 0;  %
     0 0 0;  %
     0 0 0]; %

A = mean(mean(r, 2));

% Using the power source to generate the magnetic field
I = [0 0 0;
     0 0 0;
     0 0 0
    ]; % A
B1 = [0 0 0;
      0 0 0;
      0 0 0;
     ]; % mT
B2 = [0 0 0;
      0 0 0;
      0 0 0;
     ]; % mT
Fz = [0 0 0;
      0 0 0;
      0 0 0
     ]; % N

% Pre-Uncertainty calculations
dFluke = 0; % Uncertainty in Fluke
sdI = sdt(I, 2); % Standard deviations
sdB1 = sdt(B1, 2); % Standard deviations
sdB2 = sdt(B2, 2); % Standard deviations
% Take the means
I = mean(I, 2);
B1 = mean(B1, 2);
B2 = mean(B2, 2);
Fz = mean(Fz, 2);
% Uncertainty calculations
dI = err([dFluke sdI/sqrt(3)]);
% etc ...

Chi = -Fz/(A*(B1.^2-B2.^2))*2*mu0;

%% Eksperiment Ferromagnetisme
% Magnetic field strength inside of the coil
B = [];
% Check interference from equipment
% ?

% Measurement of the magnetic field strength
% Parallel
RodBpar    = [];
SphereBpar = [];
DiskBpar   = [];

% Orthogonal
RodBort    = [];
SphereBort = [];
DiskBort   = [];

% Measurements involving iron rod
kappa  = 0; % Calibration constant for the spenningsintegrator
A      = 0; % Cross section of the iron rod
n      = 0; % Number of turns of the coil
% Current through the primary coil
I      = 4:0.5:0.5;
deltaS = [];
deltaB = kappa*deltaS/(n*A);

% Compute B and plot
B = deltaB/2;
plot(I, B);

% Compute M(H0)
% ?

%% Eksperiment Faraday-effekten
I = 0:0.5:3;