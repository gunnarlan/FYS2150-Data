
% Oppgave 2
% Vinkel relativ
R = 0:10:90 * pi/180
% Intensitet. Gjor tre maalingar
E1 = [164 158 145 124 98 72 44 25 11 7];
E2 = [164 159 145 123 98 71 45 24 11 8];
E3 = [165 159 145 124 98 70 44 24 11 8];
plot(E1, cos(R).^2, '-o')
hold on;
plot(E2, cos(R).^2, '-o');
plot(E3, cos(R).^2, '-o');
xlabel('E(\theta)')
ylabel('cos(\theta)^2')
hold off;

% Tre polarisasjonsfiltere
E = [5 6 10 13 16 16 13 10 6 5];
% Begynner saa med 5 grader for aa dekke 45
R = 5:10:85
E = [5 8 12 15 16 15 12 8 5];

% Ny serie med steg 5
R = 0:5:90
E = [5 5 6 8 10 11 13 15 16 16 16 15 13 12 10 8 6 5 5];
E = [5 5 6 8 10 12 13 15 16 16 16 15 13 12 10 8 6 5 5];
