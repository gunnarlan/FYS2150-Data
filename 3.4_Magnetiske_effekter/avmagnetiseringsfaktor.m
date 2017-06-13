function [Dpar, Dort] = avmagnetiseringsfaktor(f)
e = sqrt(1-1./f.^2);
Dpar = (1-1./e.^2).*(1-1./(2*e).*log((1+e)./(1-e)));
Dort = (1-Dpar)/2;
end