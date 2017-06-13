measurements = [247 240 244 251 257 257 244 246 231 231 219 ...
    269 298 330 408 433 461 446 510 550 515];
grad = 12:0.5:22;
start = 7; slutt = 11; 
%flatline = regress(grad(start:slutt)', measurements(start:slutt)', 'y~x');
flatline = mean(measurements(start:slutt));
skraline = regress(grad(slutt:slutt+5)', measurements(slutt:slutt+5)')
hold on
plot(grad, measurements, 'o')
plot([grad(start) grad(slutt)],[flatline flatline])
plot(skraline)

a = skraline.Coefficients.Estimate(2);
b = skraline.Coefficients.Estimate(1);

theta_two = (flatline-b)/a
% Voltage
theta = theta_two/2
two_d = 401e-12;
lambda = two_d*sin(deg2rad(theta))

e = 1.6021766*10^-19;
h = 6.626070*10^-34;
m = 9.109384*10^-31;
c = 299792458;

U = h*c/(lambda*e)

% RbCl-topper
alpha = mean([154.4 154])*1e-12;
beta = mean([139.2 138.1])*1e-12;
two_d = 655e-12;

theta_alpha_1 = 2*rad2deg(asin(1*alpha/two_d))
theta_alpha_2 = 2*rad2deg(asin(2*alpha/two_d))
theta_beta_1  = 2*rad2deg(asin(1*beta/two_d))
theta_beta_2  = 2*rad2deg(asin(2*beta/two_d))

y = [158 165 156 148 285 591 591 160 138 301 1694 1071 619 133 ...
    92 113 113];
x = 22:0.5:30;
plot(x, y)

x1 = 48:0.5:59;
y1 = [88 97 85 110 231 201 155 109 84 98 97 101 85 91 ...
    123 460 835 484 260 135 96 86 85];
hold on
plot(x1, y1)

