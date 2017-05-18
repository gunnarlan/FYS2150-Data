%% Utstyrsliste til lasermålinger
% Bosch PLR30 - Lasermåler
% Uniphase model 155 SL 1741 - He-Ne laser λ = 632.8 nm
% LD - Spalter
% Cocraft Vernier Caliper 

%% Utstyrliste til Balmer- og heliumlinje
% Gitterkonstant til Balmerlinje; 30 000 lpi
% Gitterkonsant til Heliumlinje: 15 000 lpi
%% Maalinger
mDirekte  = [7.392, 7.393, 7.397] % Avstand fra spalte til skjerm Bosch PLR30
m1        = [3.090, 3.088, 3.089] % Avstand fra spalte til speil Bosch PLR30
m2        = [4.288, 4.288, 4.287] % Avstand fra speil til skjerm Bosch PLR30
m         = mean(m1+m2)
sd_m      = std(m1+m2)
% Usikkerhet i Bosch
err       = @(a,b) sqrt(a^2+b^2);
dBosch    = err(2e-3, 1e-3);
% Usikkerhet i målingene
dmDirekte = err(std(mDirekte)/sqrt(3), dBosch);
dm1       = err(std(m1)/sqrt(3), dBosch);
dm2       = err(std(m2)/sqrt(3), dBosch);
dm        = err(dm1,dm2);
% Tar vektet gjennomsnitt
sigma = [dm, dmDirekte].^2;
M     = [m, mean(mDirekte)]
dR    = sqrt(1/sum(1./sigma));
R     = sum(M./sigma)/sum(1./sigma)

% Notasjon: V = venstre side av nullpunkt, H = høyre side av nullpunkt
% Eks. V2 er andre minima til venstre av nullpunkt
A1 = [15.08, 15.01, 15.04]*1e-2  % Maaling mellom minima til 469 91 A. Avstand
                                 % mellom V2 og H2
A2 = [7.44, 7.44, 7.51]*1e-2     % Maaling mellom minima til 469.91 A, Avstand
                                 % mellom V1 og H1
B1 = [14.58, 14.50, 14.49]*1e-2  % Maalingen mellom minima i 469.91 B, V4 og
                                 % H4
B2 = [7.38, 7.32, 7.35]*1e-2     % Maalingen mellom minima i 469.91 B, V2 og H2
C1 = [15.16, 15.21, 15.16]*1e-2  % Maalingen mellom minima i 469.91 C, V8 og
                                 % H8
C2 = [7.61, 7.60, 7.66]*1e-2     % Maalingen mellom minima i 469.91 C, V4 og H4

% Finner spaltens bredde
a = @(n, x) n*lambda*R/mean(x);
dx = @(x) err(std(x)/sqrt(length(x)), dCocraft);
da = @(n, x) a(n, x)*err(dR/R, dx(x)/mean(x));
% Usikkerhet i Cocraft
dCocraft = err(0.01e-3, 0.03e-3);
lambda = 632.8e-9;
a1     = a(4,A1);
da1    = da(4,A1);
a2     = a(2, A2);
da2    = da(2, A2);

b1     = a(8, B1);
db1    = da(8, B1);
b2     = a(4, B2);
db2    = a(4, B2);

c1     = a(16, C1);
dc1    = da(16, C1);
c2     = a(8, C2);
dc2    = a(8, C2);

% Bilder fra gittere ligger på github
x = (-3:0.01:3)*1e-4;
plot(luminans(x, R, 0.12, 2, 0.6))

% Målinger av sirkulært apratur. Alle maalingr med Vernier Caliper
innersteRing       = [0.36, 0.35, 0.35]*1e-2 % 469 96 1 Minima Diameter
nestInnersteRing   = [0.66, 0.66, 0.67]*1e-2 % 469 96 1 Minima Diameter
tredjeInnersteRing = [0.94, 0.94, 0.94]*1e-2 % 469 96 1 Minima Diameter
rRaw               = [1.158, 1.159, 1.157]   % Avstand til skjerm. Maalt med lasermåler
innersteRing       = innersteRing/2;
nestInnersteRing   = nestInnersteRing/2;
tredjeInnersteRing = tredjeInnersteRing/2;
% Teoretisk verdi
a                  = 0.48e-3

% Avstand
R                  = mean(rRaw);
dR                 = err(std(rRaw)/sqrt(3), dBosch);

% Nullpunkter til Besselfunksjon J1
w                  = [0 3.832 7.016 10.173 13.324];

% Teoretisk r
rTeori             = lambda*R/(pi*a)*w;
% Usikkerhet i ringens radius
r                  = @(x) mean(x);
dr                 = @(x) err(std(x)/sqrt(length(x)), dCocraft);

% Usikkerhet i apparturets diameter
% a                = @(x, n) lambda*R/(pi*r(x))*w(n);
% da               = @(x, n) a(x, n)*err(dR/R, dr(x)/r(x));

r1                 = r(innersteRing);
dr1                = dr(innersteRing);

r2                 = r(nestInnersteRing);
dr2                = dr(nestInnersteRing);

r3                 = r(tredjeInnersteRing);
dr3                = dr(tredjeInnersteRing);

