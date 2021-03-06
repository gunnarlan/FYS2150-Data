m = 0:0.5:3.5;
hf = [9.08 9.08 9.08 9.08 9.08;  % 0 
    9.08 9.09 9.08 9.09 9.09;    % 0.5
    9.09 9.09 9.09 9.09 9.09;    % 1.0
    9.09 9.09 9.09 9.09 9.09;    % 1.5
    9.09 9.10 9.11 9.10 9.10;    % 2.0
    9.11 9.12 9.12 9.12 9.12;    % 2.5
    9.12 9.13 9.13 9.13 9.13;    % 3.0
    9.12 9.11 9.12 9.13 9.13     % 3.5
    ];
he = [9.08 9.08 9.08 9.08 9.08;  % 0
    8.35 8.35 8.35 8.35 8.35;    % 0.5
    7.61 7.61 7.61 7.61 7.62;    % 1.0
    6.88 6.88 6.88 6.88 6.89;    % 1.5
    6.15 6.15 6.6 6.15 6.15;     % 2.0
    5.43 5.43 5.44 5.44 5.43;    % 2.5
    4.70 4.71 4.72 4.71 4.71;    % 3.0
    3.99 3.96 3.96 3.96 3.96     % 3.5
    ];
h = mean(hf - he, 2) % Find the difference
df = table(h, m(1:length(h))', 'VariableNames', {'h','m'});
lm = fitlm(df, 'h~m')

g = 9.825; % g
Ldata = [148.9 148.8 149.0]*10^-2;
L = mean(Ldata); % m
M = 2.552; % Kg
ldata = [135.8 135.9 135.9]*10^-2;
ddata = [15.97 15.98 15.97]*10^-3;
l = mean(ldata); % m
d = mean(ddata);  % m
A = lm.Coefficients.Estimate(2)*10^-3;
sA = lm.Coefficients.SE(2)*10^-3;
sd = std(ddata)/length(ddata);
sl = std(ldata)/length(ldata);
E = 4*l^3*g/(3*pi*abs(A)*d^4)
dE = E*sqrt((sA/A)^2+(4*sd/d)^2+(3*sl/l)^2)
f = sqrt(E/(16*M*L)*pi*d^2)

sM = 0.004;
dsf = 15;
sf = 1.23e3;
sd = std(ddata);
sL = std(Ldata);
E2 = 16*M*L*sf^2/(pi*d^2)
dE2 = E2*sqrt((2*sd/d)^2+(2*dsf/sf)^2 + (sL/L)^2 + (sM/M)^2)
% Kjoreeksempel %
%%%%%%%%%%%%%%%%%
% Linear regression model:
%     h ~ 1 + m
% 
% Estimated Coefficients:
%                     Estimate        SE        tStat        pValue  
%                    __________    ________    ________    __________
% 
%     (Intercept)    -0.0063333    0.021301    -0.29732       0.77625
%     m                  1.4708    0.010184      144.42    7.4339e-12
% 
% 
% Number of observations: 8, Error degrees of freedom: 6
% Root Mean Squared Error: 0.033
% R-squared: 1,  Adjusted R-Squared 1
% F-statistic vs. constant model: 2.09e+04, p-value = 7.43e-12