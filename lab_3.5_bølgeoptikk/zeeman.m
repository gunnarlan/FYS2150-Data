names = {'I10400P0.jpg', 'I19906P0.jpg', 'I30001P0.jpg', 'I40094P0.jpg', ...
         'I43410P0.jpg'}

if(0)
for n = 1:numel(names)
    img = imread(names{n});
    [X, Y, ~] = size(img);
    imshow(img);
    hold on;
    x = 0:1:X+300-1;
    y = 0:1:Y+100-1;
    plot(x, ones(X+300, 1)*525, 'b-', 'linewidth', 2)
    plot(ones(Y+100, 1)*591, y, 'b-', 'linewidth', 2)
    hold off;
    input('Tast for å fortsette')
end
end
% Sentrum
%        [ X   Y ]
center = [591 525];
% names{1}
% r1 i vertikal retning
r1V = [592 176;   % Bilde 1
       593 182;   % Bilde 2
       593 198;   % Bilde 3
       593 210;   % ...
       594 208];  % Bilde 5
% r1 i horisontal retning
r1H = [248 524;
       258 526;
       270 523;
       279 524;
       281 523];
r2V = [590 153;
       593 143;
       592 135;
       593 131;
       594 126];
r2H = [228 526;
       219 526;
       210 523;
       202 523;
       201 522];
r3V = [590 11;
       593 15;
       593 25;
       593 34;
       593 32];
r3H = [87 526;
       93 524;
       102 523;
       105 523;
       109 523];

diameter = @(r) 2*sum(sqrt((r-center).^2),2)

d1H = diameter(r1H);
d2H = diameter(r2H);
d3H = diameter(r3H);
d1V = diameter(r1V);
d2V = diameter(r2V);
d3V = diameter(r3V);

% Gunnarkode
I=[0 0.54 1.04 1.54 1.99 2.47 3.00 3.54 4.01 4.34];
B=[6.62 95.3 180.0 271.8 357.2 440.6 529.4 621.2 691.2 727.2];

Measured_I=[4.3410 4.0107 4.0094 3.0000 1.9906 1.0400];

[a,b]=str_lin1(I(end), B(end), I(end-1), B(end-1));
B1=a(1)*Measured_I(1)+b;

[a,b]=str_lin1(I(end-1), B(end-1), I(end), B(end));
B2=a(1)*Measured_I(2)+b;

[a,b]=str_lin1(I(end-1), B(end-1), I(end-2), B(end-2));
B3=a(1)*Measured_I(3)+b;

[a,b]=str_lin1(I(end-4), B(end-4), I(end-3), B(end-3));
B4=a(1)*Measured_I(4)+b;

[a,b]=str_lin1(I(6), B(6), I(5), B(5));
B5=a(1)*Measured_I(5)+b;

[a,b]=str_lin1(I(3), B(3), I(2), B(2));
B6=a(1)*Measured_I(6)+b;

B_measured=[B6 B5 B4 B3 B1]';
B = [180 357.2 529.4 691.2 727.2];
% Regn ut Bohr magneton
t = 3e-3;
c = 299792458;
h = 6.626e-34;
deltaNu = @(d1, d2, d3)  c/(2*t) * (d2-d1)./(d3-d1);
magneton = @(d1, d2, d3, B) deltaNu(d1, d2, d3)./(2*B)*h;


dD1 = ((d1H-d1V)./2).^2;
dD2 = ((d2H-d2V)./2).^2;
dD3 = ((d3H-d3V)./2).^2;

B_accuracy = 0.2;
dB = sqrt((B_accuracy/100*max(B))^2 + 0.1^2)
dt = 0.01e-3;

D1 = mean([d1H d1V], 2).^2;
D2 = mean([d2H d2V], 2).^2;
D3 = mean([d3H d3V], 2).^2;
dU = 2*sqrt((D1.*dD1.*(D2-D3).^2 + D2.*dD2.*(D1-D3).^2 + D3.*dD3.*(D1- ...
                                                  D2).^2)./(D2-D3).^4);
U = (D2-D1)./(D3-D1);

muB = magneton(D1, D2, D3, B');
dMuB = muB.*sqrt((dt/t)^2+(dB./B').^2+(dU./U).^2)