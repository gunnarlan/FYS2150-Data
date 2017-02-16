a=3.5;
b=5.0;
x=0:0.1:2;
n=length(x);
y=a+b.*x+randn(1,n);

D=sum(x.^2)-(1.0/n)*(sum(x))^2;
E=sum(x.*y)-(1.0/n)*sum(x)*sum(y);
F=sum(y.^2)-(1.0/n)*(sum(y))^2;
ybar=(1.0/n)*sum(y);
xbar=(1.0/n)*sum(x);
m=E/D;
c=ybar-m*xbar;
d=y-m*x-c;

prefac=(1.0/(n-2));
prefac_2=(D*F-E^2)/(1.0*D^2);
prefac_3=(D/(1.0*n))+(xbar)^2;
delta_m=sqrt(prefac*prefac_2);
delta_c=sqrt(prefac*prefac_2*prefac_3);
a
c
delta_c

b
m
delta_m

