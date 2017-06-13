k = [4 6 5 9 2 3 2 3 7 5 6 2 1 4 3 1 5 5 4 1 7 7 1 6 ...
    1 4 8 6 4 2 7 4 5 8 1 5 4 6 9 7 2 3 2 6 1 10 3 4 9 8 ...
    2 7 1 7 4 5 3 2 6 0 2 2 4 12 2 4 2 4 7 6 1 8 6 4 4 5 ...
    2 3 4 7 6 9 6 3 7 3 3 2 4 3 2 2 2 3 5 2 5 5 6 3 5 5 3];
size(k);
h = histogram(k);
title('k counts for 137 Cs')
m = mean(k);
s = std(k);
sqrt(m);
hold on
%y = poissdf(0:0.1:max(k),m);
N = size(k);
N = N(2);
Y = zeros(12,1);
Y(1) = N*exp(-m);
for i = 1:1:12
    Y(i+1) = m/i*Y(i);
end
plot(0:1:12,Y)
%%
% Maaler i 60 s
nr = mean([251 273 247 246 242 251 267 273 259])/60;
nb = mean([37 37 31 30 33 36 42 43 34 37 33 45])/60;
A0 = 230e3;
tau = 30.05;                      % Halveringstid
t0 = 2017-2003;                   % Tid fra maalt aktivitet 230
A = A0*exp(-t0/tau);

d = 22e-3;                        % Diameter til GM-ror
r = d/2;
R = 10.5e-2;                      % Areal GM-vindu
%omega = areal/r^2;                % Romvinkel
epsilon = (nr-nb)/(A*r^2/(4*R^2)); %E

%% Oppgave B
Nb = 187;         % maalt i 10 min
dnb = sqrt(Nb)/(60*10);
nb = Nb/(60*10);

Nr = [1000 1000 1000 1000 1000 1000];
dt = [7*60+27, 4*60+36.09, 2*60+59.19, 1*60+49.41, 1*60+2.81, 38]; % s
dnr = sqrt(Nr)./dt;
nr = Nr./dt;
n = nr - nb;
dn = sqrt(dnb.^2+dnr.^2);

% Tykkelse til platene nummeret fra 1 (forste plate som ble fjernet)
% til 5 (siste plate som ble fjernet)
plate1 = mean([4.95 4.92 4.91 4.91 4.94]);
plate2 = mean([5.11 5.06 5.01 5.10 5.04 5.04]);
plate3 = mean([5.02 5.05 5.06 5.02 5.01 5.04]);
plate4 = mean([5.05 5.05 5.10 5.08 5.04 5.05]);
plate5 = mean([5.06 5.11 5.06 5.07 5.06 5.09]);

blytykkelse = [0;
    plate5;
    plate5+plate4;
    plate5+plate4+plate3;
    plate5+plate4+plate3+plate2;
    plate5+plate4+plate3+plate2+plate1]';

n = fliplr(n);
dn = fliplr(dn);
low_error = log(n-dn);
high_error = log(n+dn);

lm = regress(blytykkelse', log(n)');
hold on
plot(lm)
plot(blytykkelse, log(n), 'o')
plot(blytykkelse, low_error, 'k-o')
plot(blytykkelse, high_error, 'k-o')
title('Count vs lead thickness')
xlabel('Lead thickness [mm]')
ylabel('Radiation [Bq]')