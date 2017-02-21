plot(log10(frekvens), log10(Vu_over_Vi), 'o')
title ('Frekvens mot Vu/V_i');
xlabel('Frekvens');
ylabel('Vu/V_i');
polynomial=polyfit(log10(frekvens(end-8:end)), log10(Vu_over_Vi(end-8:end)), 1);
omega_0=10^(polynomial(2));
f1=polyval(polynomial, log10(frekvens(end-8:end)));
hold on
plot(log10(frekvens(end-8:end)),f1);
omega=logspace(0, 4)
Vu_vi=1.0./(sqrt(1+(omega/omega_0).^2));
hold on
plot(log10(omega), log10(Vu_vi), 'o')
legend('Datasett', 'Polyfit','Simulerte data');


