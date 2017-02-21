load -ascii varmeled.dat;
t=varmeled(:,1);
T1=varmeled(:,2);
T2=varmeled(:,3);
x1=0.032;%m Sett inn riktig avstand
x2=0.092;%m Sett inn riktig avstand
Delta_T=T1(1)+5.5;%
ei1=erfinv(T1/Delta_T); 
ei2=erfinv(T2/Delta_T);
eta_d1=x1./sqrt(4*t);
eta_d2=x2./sqrt(4*t);
figure(1)
plot(eta_d1,ei1,'o')
hold on
plot(eta_d2,ei2,'*')
hold off