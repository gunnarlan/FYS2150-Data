% spektrum = importdata('ce_spektrum.asc','	',1);
% spektrum = spektrum.data(:,2);
% fwhm(spektrum, 332, 462)
% 137Cs
% 662 keV
% Start    332
% Stopp    462
% Centroid 400.414
% Std      15.167
% FWHM     35.643

% 22Na
% 511 keV
% Start    264
% Stopp    354
% Centroid 313.464
% Std      11.778
% FWHM     27.678
%
% 1275 keV
% Start    700
% Stopp    824
% Centroid 766.493
% Std      18.213
% FWHM     42.801

syms dE E0
eqn1 = 622e3 == dE*400.414 + E0;
eqn2 = 1275e3 == dE*766.493 + E0;
format compact
X = solve([eqn1, eqn2], [dE E0]);
%[A,B] = equationsToMatrix([eqn1, eqn2], [dE E0]);
%X = linsolve(A,B);
double(X.dE)
double(X.E0)

deltaE = (1275e3-622e3)/(766.493-400.414)
e0 = 622e3-deltaE*400.414

% 60Ni
% 2505-1332=1173 keV
% Start    638
% Stopp    750
% Centroid 705.690
% Std      16.833
% FWHM     39.558
%
% 1332 KeV
% Start    748
% Stopp    858
% Centroid 802.126
% Std      17.555
% FWHM     41.253
E1 = 2505-1332;
E2 = 1332;
I = deltaE*[705.690 802.127 766.493] + e0
