A=5; %Svingeamplitude
omega=50; %Svingefrekvens
frequency=1000; %Samplingsfrekvens
n=2000; %Svarer til 2sek
sigma=0.2*A; %For Gauss noise
mu=0;
linear_trend_factor=0.1*A; %Storrelse paa drift
x=linspace(0,1.0*frequency/n, n);
noise=normrnd(mu,sigma, [1 n]);
linear_drift=linspace(0, linear_trend_factor, n);
signal=A*sin(omega*x);
Data=signal+noise+linear_drift;

%Plot av data
figure(1)
plot(x,Data);
title('Maalinger');
xlabel('Sekunder, s [s]');
ylabel('Volt, V [V]');

%Histogram
bins=n/20.0;
figure(2)
histogram(Data, bins); %Histogram av alle data
title('Histogram av maalingene');
xlabel('Volt, V [V]');
ylabel('Absolutt frekvens');

%%%%Kommentar til fordeling%%%
%Ser at fordelingen er bimodal, med topper ved maksimum av kurven%
%Her er den deriverte minst, og siden samplingsfrekvensen er konstant,
%endrer sysmtemet seg minst her. Dermed er det flest datapunkter her. Merk
%ogsaa at gjennomsnittet ikke ser ut til aa vaere noyaktig null, baade pga.
%noise og pga. drift
%%%

%Histogram av stoy
figure(3)
gaussian_noise=Data-signal-linear_drift;
title('Histogram av stoyet');
xlabel('Volt, V [V]');
ylabel('Absolutt frekvens');
histogram(gaussian_noise) %Histogram kun av stoy

%Normalisering av stoy histgoramet
noise_data=histogram(Data-signal-linear_drift, bins);
noise_values=noise_data.Values;
noise_bins=noise_data.BinEdges(1:end-1)+noise_data.BinWidth/2;
noise_bins=sigma*noise_bins+mu; %Normaliser variablene
noise_values=sigma*noise_values+mu;
area=sum(noise_values.*(noise_bins(2)-noise_bins(1))); %Verdiene*bredde

figure(4)
scatter(noise_bins,noise_values/area);
hold on
plot(xhist, normpdf(xhist, 0, 1)) %Sammeling med standard normalfordeling
title('Normalisert histogram av stoyet, med normalfordeling');
xlabel('Volt, V [V]');
ylabel('Relativ frekvens');
legend('Data', 'Normal distribution');


%Ta ut lineaer trend - bruker innebygd Matlab funksjon
figure(5)
trend=detrend(Data);
hold off
plot(x, trend);
title('Maalinger');
xlabel('Sekunder, s [s]');
ylabel('Volt, V [V]');


