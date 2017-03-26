function [tw,fw,n,fut,power]=stykkevisFFT(t,y,wp2,fmin);
%
%Input-parametre:
%
%t= tidsvektor [s]
%y=amplitudevektor 
%wp2       bw
%   8      256
%   9      512
%   10    1024
%   11    2048
%   12    4096
%   13    8192
%   14   16384
%   15   32768
%   16   65536
%fmin=minimal frekvens [Hz]
%
%Ut:
%
%tw=midlere tid for hvert intervall
%fw=frekvens i hvert intervall
%fut=frekvenser til plotting
%
bw=2.^wp2;
lin=length(t);
n=floor(lin/bw);
t=t(1:n*bw);
y=y(1:n*bw);
%Gjør t og y om til n vektorer med lengde bw
tr=reshape(t,bw,n);
yr=reshape(y,bw,n);
%tw er tiden midt i hvert intervall
tw=tr(bw/2,:);
%samplingsfrekvens
fs=1/(t(2)-t(1));
%frekvensakse
fut = fs/2*linspace(0,1,bw/2);
%indeks for frekvens fmin HZ
nf=min(find(fut>fmin));
%gjør fft på hver segment
power=zeros(n,bw/2);
for i=1:n
    Y = fft(yr(:,i),bw,1)/bw;
    power(i,:)=abs(Y(1:bw/2)).^2;
    [ym j]=max(abs(Y(nf:bw/2)).^2);
    fw(i)=fut(j+nf-1);
end
%plot(fut,abs(Y(1:bw/2)).^2,'.-')
    
