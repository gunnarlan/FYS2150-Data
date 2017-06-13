function FWHM = fwhm(telling, start, stopp)
stopp = [stopp telling(stopp)];
start = [start telling(start)];
delta = stopp-start;
a = delta(2)/delta(1);
b = start(2)-start(1)*a;
x = 1:1:length(telling);
X = start(1):1:stopp(1);
T = telling;
T(or(x<start(1), x>stopp(1))) = 0;
T(X) = T(X)-(a*X'+b);
plot(T)

hold on
[maxvalue, argmax] = max(T);
argmax
plot(argmax, maxvalue, 'o')
lower = find(T>maxvalue/2, 1, 'first');
higher = find(T>maxvalue/2, 1, 'last');
line([lower lower], [0 maxvalue/2], 'Color', 'r', 'LineWidth', 1);
line([higher higher], [0 maxvalue/2], 'Color', 'r', 'LineWidth', 1);
line([lower higher], [maxvalue/2 maxvalue/2], 'Color', 'r', 'LineWidth', 1);
FWHM = higher-lower;

norm = normpdf(x,argmax, FWHM/(2*sqrt(2*log(2))));
norm = norm/max(norm)*maxvalue;
plot(norm)