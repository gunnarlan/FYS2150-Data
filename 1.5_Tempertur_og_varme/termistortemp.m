function [ T ] = termistortemp(R)
a = 8.42e-4;
b = 2.068e-4;
c = 8.591e-8;
T = 1./(a+b*log(R)+c*log(R).^3)-273.16;

end

