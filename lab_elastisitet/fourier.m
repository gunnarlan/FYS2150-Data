close all
[signal, sf] = audioread('messing_lyd.wav');
signal = signal';
fbar = 1.110e3;     % Hz
N = length(signal)-1;
dt = 1/sf;          % Timestep
t = 0:dt:100*dt;      % Time
omega = 2*pi*fbar;  % Angular frequency
x = sin(2*pi*1005*t);
y = sin(2*pi*1000*t);
%figure(1)
%plot(t, x)
%figure(2)
newSignal = x + y;
%plot(t, newSignal)

%sound(newSignal(1:floor(N/5)))
%soundview(newSignal)
figure(3)
hold on
Y = fft(newSignal);
freq = sf*(0:(N/2))/N;
P2 = @(y) abs(y/N);
P1 = @(p2) p2(1:N/2+1);

newP1 = P1(P2(Y));
newP1(2:end-1) = 2*newP1(2:end-1);
plot(freq, newP1)

Y = fft(x);
newP1 = P1(P2(Y));
newP1(2:end-1) = 2*newP1(2:end-1);
%plot(freq, newP1)
legend('show')