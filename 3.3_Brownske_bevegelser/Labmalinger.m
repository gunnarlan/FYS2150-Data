% Bildet av histogram er navngitt som spacingmicrons
% 20X
% 4.5 mm square grid 
% 0.1 mm spacing
% 15 microns

% 4.5 mm square grid
% 0.1 mm spacing
% 10 microns linewidth

% 2.55 mm square grid
% 0.05 mm spacing
% 2.5 microns linewidth

% 40X
% 2.55 mm square grid
% 0.075 mm spacing
% 5 microns linewidth

% 2.55 mm square grid
% 0.005 mm spacing
% 5 microns linewidth

% 2.55 mm square grid
% 0.005 mm spacing
% 2.5 microns linewidth

%% Brownske bevegelse
% Temperaturen ved partiklene er 
T = [27.6 27.4 28.2 28.4 27.8];
% Maaler temperaturen en time senere, og legger merke til
% at temperaturen har okt.
T = [29.2 31.2 29.4 30.6 31.6];
t = mean(T)+273.15;
k = 1.38e-23;
r = 0.99e-6;
mu = 1e-3;
dxsqdt = k*t/(3*pi*mu*r)

dxsqdtemp = (2.3e-04*1e-3)^2*15*0.81