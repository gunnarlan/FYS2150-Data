%% Utstyrsliste til lasermålinger
% Bosch PLR30 - Lasermåler
% Uniphase model 155 SL 1741 - He-Ne laser λ = 632.8 nm
% LD - Spalter
% Cocraft Vernier Caliper 

%% Utstyrliste til Balmer- og heliumlinje
% Gitterkonstant til Balmerlinje; 30 000 lpi
% Gitterkonsant til Heliumlinje: 15 000 lpi
%% Maalinger
m = [7.392, 7.393, 7.397] % Avstand fra spalte til skjerm Bosch PLR30
m1 = [3.090, 3.088, 3.089] % Avstand fra spalte til speil Bosch PLR30
m2 = [4.288, 4.288, 4.287] % Avstand fra speil til skjerm Bosch PLR30
m = mean(m1+m2)
sd_m = sd(m1+m2)

% Notasjon: V = venstre side av nullpunkt, H = høyre side av nullpunkt
% Eks. V2 er andre minima til venstre av nullpunkt
a1 = [15.08, 15.01, 15.04]*1e-2 % Maaling mellom minima til 469 91 A. Avstand
                               % mellom V2 og H2
a2 = [7.44, 7.44, 7.51]*1e-2 %Maaling mellom minima til 469.91 A, Avstand
                             %mellom V1 og H1
b1 = [14.58, 14.50, 14.49]*1e-2 % Maalingen mellom minima i 469.91 B, V4 og
                                % H4
b2 = [7.38, 7.32, 7.35]*1e-2 % Maalingen mellom minima i 469.91 B, V2 og H2
c1 = [15.16, 15.21, 15.16z]*1e-2 % Maalingen mellom minima i 469.91 C, V8 og
                                 % H8
c2 = [7.61, 7.60, 7.66]*1e-2 % Maalingen mellom minima i 469.91 C, V4 og H4

% Bilder fra gittere ligger på github

% Målinger av sirkulært apratur. Alle maalingr med Vernier Caliper
innersteRing = [0.36, 0.35, 0.35]*1e-3 % 469 96 1 Minima Diameter
nestInnersteRing = [0.66, 0.66, 0.67]*1e-3 % 469 96 1 Minima Diameter
tredjInnersteRing = [0.94, 0.94, 0.94]*1e-3 % 469 96 1 Minima Diameter
R = [1.158, 1.159, 1.157]% Avstand til skjerm. Maalt med lasermåler