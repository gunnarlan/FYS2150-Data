%Akvisisjonparametre
duration = 10; %[s] akvisisjontid
samplerate=96000; 
folder = 'figures/';
%Parametre for analysen
fin=1000; %Velg en frekvens litt (>500Hz lavere) under frekvensen målt i ro
wp2=19; %Antall sample i hvert tidsvindu blir 2.^wp2
%Gjør klar og samle inn data
[DS,devicename]=initDaqSession(duration,samplerate,1);
addAudioInputChannel(DS,devicename, 1);
[data, time] = startForeground(DS);
figure(1), plot(time,data), xlabel('Time [s]'), ylabel('Amplitude')
saveas(gcf, [folder 'Amplitude' int2str(maaling) '.eps'])
%Gjør FFT på tidsvinduer
[tw,fw,n,fut,power]=stykkevisFFT(time,data,wp2,fin);
%Plott frekvensene som funksjon av tid
figure(2),plot(tw,fw,'o'),xlabel('Time [s]'),ylabel('Frequency [Hz]')
saveas(gcf, [folder 'Frequency' int2str(maaling) '.eps'])
%Plott ut Power-spekteret for intervall i (1<=i<=n)
i=1;
figure(3),plot(fut(2:end/10),power(i,2:end/10),'.-')
xlabel('Frequency [Hz]')
ylabel('Energi')
saveas(gcf, [folder 'Energy' int2str(maaling) '.eps'])
saveas(gcf, [folder 'Energy' int2str(maaling) '.png'])
%Lag din egen funksjon v(fw) og plott
%figure(3), plot(tw,v)

filename = ['frequency_measureement_' int2str(maaling) '.mat']% input('Hvilket filnavn vil du bruke for å lagre dataene?','s');

save(filename,'time','data','tw','fw','fut','power','n')
