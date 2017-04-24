%% Utstyrliste til Balmer- og heliumlinje
% Gitterkonstant til Balmerlinje; 30 000 lpi
% Gitterkonsant til Heliumlinje: 15 000 lpi

% Balmerlinjemålinger
% Rød
r = [180.0, 281.7]
r_øvre = [180.0, 281.8]
r_nedre = [179.9, 281.6]

% Blå 
b = [196.1, 266.2]
b_øvre  = [196.1, 266.3]
b_nedre = [196.0, 266.2]

% Fiolett - Så ikke trådkors, prøvde å sentrere
f = [201.1, 261.6]
f_øvre = [201.5, 261.9]
f_nedre = [199.6, 261.3]

% Nøytrallinje
n = [231.5]
n_nedre = [231.4]
n_øvre = [231.5]

% Heliumlinjemålinger
% Alle målinger har tre "bilder". Én til venstre for den nøytrale linjen og
% to til høyre. Tar bare med én fra hver side da den andre på høyre side
% var så svake at det var umulig å lese av.
% Rød
r_nedre = [159.8, 207.0]
r_øvre = [160.0, 207.1]
r = mean(r_øvre, r_nedre)

% Gul
g_nedre = [162.8, 204.0]
g_øvre = [162.9, 204.1]
g = mean(g_nedre, g_øvre)

% Grønn
g_nedre = [165.9, 200.9]
g_øvre = [166.0, 201.0]
g = mean(g_nedre, g_øvre)

% Blå 
b_nedre = [167.1, 199.7]
b_øvre = [167.2, 199.8]
b = mean(g_nedre, g_øvre)

% Fiolett
f_nedre = [167.8, 198.9]
f_øvre = [167.9, 199.0]
f = mean(f_nedre, f_øvre)

% Nøytral
n = mean([183.3, 183.4])