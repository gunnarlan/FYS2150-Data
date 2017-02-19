%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Måler en spenning AI0 til AIGND
%Tar FFT for å finne den dominerende frekvensen i signalet
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Parametre som må settes av dere
Tau=1;%s varighet eller samplingstid for en måling
fs=20;%Hz, samplerate
amplitude=0.2;%V Mål maks spenning med multimeter og sett til 0.2, 1, 5 eller 10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gjør måling
[DS,devicename]=initDaqSession(Tau,fs,0);
[AI]=initADchannel(DS,devicename,1,'SingleEnded',amplitude);
[datain, time] = startForeground(DS);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Anlayser data: Ta Fouriertransformasjonen for å finne frekvensen
U=detrend(datain); %fjern DC-komponent fra signalet
P=abs(fft(U)).^2; %Finn effekten i Fourier-spekteret
ff=0:1/Tau:fs/2; %Frekvensene i Fourier-spekteret
[Pm,im]=max(P); %Finn største bidrag i Fourier-spekteret = målt frekvens
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vis resultatene i figurer
figure(2), plot(ff,P(1:length(ff)))
figure(1), plot(time,U)
ff(im)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
