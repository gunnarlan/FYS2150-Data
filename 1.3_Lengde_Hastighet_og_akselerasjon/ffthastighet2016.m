%filename = input('Hvilket filnavn vil du bruke for å lagre dataene?','s');
%Akvisisjonparametre
duration = 5; %[s] akvisisjontid
samplerate=96000; 
%Parametre for analysen
fin=11000; %Velg en frekvens litt (>500Hz lavere) under frekvensen målt i ro
wp2=14; %Antall sample i hvert tidsvindu blir 2.^wp2
%Gjør klar og samle inn data
[DS,devicename]=initDaqSession(duration,samplerate,1);
addAudioInputChannel(DS,devicename, 1);
[data, time] = startForeground(DS);
figure(1), plot(time,data), xlabel('tid, s'), ylabel('amplitude')
saveas(gcf, strcat(filename, counter, '_amplitude.png'))
%Gjør FFT på tidsvinduer
[tw,fw,n,fut,power]=stykkevisFFT(time,data,wp2,fin);
%Plott frekvensene som funksjon av tid
figure(2),plot(tw,fw,'o'),xlabel('tid, s'),ylabel('frekvens, Hz')
saveas(gcf, strcat(filename, counter, '_fin.png'))
%Plott ut Power-spekteret for intervall i (1<=i<=n)
i=1;
figure(3),plot(fut(2:end),power(i,2:end),'.-')
saveas(gcf, strcat(filename, counter, '_frekvens.png'))
xlabel('frekvens, Hz')
ylabel('Energi')
%Lag din egen funksjon v(fw) og plott
f = mean(fw(1:10));
%f = 1.3
T = 21.6; 
c = 331.1 + 0.606*T;
v = c*(fw - f)./fw;
figure(4), 
plot(tw,v), xlabel('tw [s]'), ylabel('v(fw) [m/s]')
saveas(gcf, strcat(filename, counter, '_fart.png'))

save(strcat(filename, counter))


