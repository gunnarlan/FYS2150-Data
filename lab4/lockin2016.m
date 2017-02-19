simulering = false;

%M?leparametre
f=10;% signalfrekvens
fs=1e3;%Hz, samplingsfrekvens
Tau=10;%s, m?leperiode

% Stygge l?sninger for differansen p elngden 1 for data og simulering :-(

if ~simulering
    % time, datafreq, SampleRate, Varighet, VBro skal være der etter gen_osc er kjørt
    t = time;
    f = datafreq;
    fs = SampleRate;
    Tau = varighet;
    V = Vbro; % Bruk resultatene fra f.eks. gen_soc2012
else
    %Simulert signal slik vi "m?ler" det
    % Skru av driften, mer komplisert ? analysere
    t=0:1/fs:Tau;
    A=1E-3;
    dphi = pi/6;
    stoy = 0.1E-3;
    drift = 0.;
    V=A*sin(2*pi*t*f+dphi)+stoy*A*randn(length(t),1)'+drift*t;
    %V=V(1:end-1)';
end

figure(1), plot(t,V)
xlabel('t, s')

%%%%%%%% Analyse %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dette kan gj?res enten p? det syntetiske signalet laget over eller p? et
% virkelig signal fra AD-omformeren der man kjenner eksitasjonsfrekvensen
% som n?r man bruker skriptet gen_osc.m


%Analyseparametre
numper=20; %Antall perioder vi vil midle over for ? finne DC-komponenten i signalet

%Finn DC-komponenten av signalet og fjern den
windowSize=floor(numper*fs/f);
% Forst?r ikke hav filteret skal gj?re, resultatene blir merkelig
% Sikkert ment ? ta hensyn til drift...men enklere med antagelse at
% drift er negligerbar og skal bare bli kvitt en konstant DC
%VDC=filter(ones(1,windowSize)/windowSize,1,V);
VDC = mean(V(windowSize:end-windowSize));
%VAC=V(windowSize:end-windowSize)-VDC(windowSize:end-windowSize);
%VAC=V(windowSize:end-windowSize)-VDC;
%tAC=t(windowSize:end-windowSize);
VAC=V-VDC;
tAC=t;

%Beregn RMS-verdien (slik et multimeter gj?r det)
VRMS=sqrt(sum(VAC.*VAC)./(tAC(end)-tAC(1))/fs);
A_RMS=sqrt(2)*VRMS; %Amplituden som kan sammenlignes med amplituden A
%Figur som viser hvordan amplitudem?lingen g?r mot en riktig verdi
figure(2), plot(tAC,sqrt(2)*sqrt(cumsum(VAC.*VAC)./(tAC-tAC(1))/fs))
xlabel('t, s')
ylabel('Amplitude')
title('Amplitude m?lt med RMS midlet fra tid 0 til t')
if simulering
    text(Tau/2,1.1*A,['avvik: ',num2str((A_RMS/A-1)*100),'%'])
end

%Beregn amplituden ved ? multiplisere med sin() og cos() til riktig
%frekvens. Det er dette en lock-in-forsterker gj?r
X=cumsum(VAC.*sin(2*pi*tAC*f))./(tAC-tAC(1))./fs;
Y=cumsum(VAC.*cos(2*pi*tAC*f))./(tAC-tAC(1))./fs;
A_LI=2*sqrt(X.^2+Y.^2);
figure(3), plot(tAC',A_LI)
xlabel('t, s')
ylabel('Amplitude')
title('Amplitude m?lt med lock-in midlet fra tid 0 til t')
%text(Tau/2,A/2,['avvik: ',num2str((A_LI(end)/A-1)*100),'%'])
A_RMS
A_LI(end)

