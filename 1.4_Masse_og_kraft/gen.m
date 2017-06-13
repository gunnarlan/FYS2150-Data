load('Vbro.mat')
N = length(Vbro);
A = 5;                   % Amplitude [v]
f = 10;                  % Frekvens på påtrykt spenning [Hz] 
fs = 1000;               % Samplingfrekvens [Hz]
sigma = f*0.05;          % Standardavvik
mu = 10;

X = fft(Vbro);           % Frekvensspekter
F = fs*(-N/2:N/2-1)/N;   % Frekvensene

low = -fs*1/2+mu;        % Omform mu til å passe F
high = fs*1/2-mu;        
filter = normpdf(F, low, sigma) + normpdf(F, high, sigma);

Y = ifft(filter.*X);     % Filtrert signal

% subplot(2,1,1)
% plot(Vbro)               % Original signal
% hold on
% plot(Y);                 % Filtered signal

% subplot(2,1,2)
% plot(F, X/12000)         % Orginial frequencies
% hold on
% plot(F, filter)          % Filter
% plot(F, filter.*Y)       % Filtered frequencies

e = sqrt(1/N*sum(Y.^2))
relV = e/(1/sqrt(2)*A)