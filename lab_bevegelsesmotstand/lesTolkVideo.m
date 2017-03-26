%---------------------------------------------------------------------
% Program for bildebehandling i laboppgave om luftmotstand for 
% FYS2150. Skrevet av Ole Ivar Ulven, V-12.
%---------------------------------------------------------------------

%---------------------------------------------------------------------
% Les inn film
% Studenten må selv sette inn korrekt filnavn
%---------------------------------------------------------------------

videonavn   = 'ballongfilm.avi'; %Navnet på filmen dere vil hente bilder fra

film = VideoReader(videonavn);
nFrames = film.NumberOfFrames;
vidHeight = film.Height;
vidWidth = film.Width;
frameRate = film.frameRate;

%---------------------------------------------------------------------
% Innstillinger som studenten selv må sette opp
%---------------------------------------------------------------------

nstart      = 34; %Nummeret på det første bildet du vil bruke i filmen
nslutt      = 256; %Nummeret på det siste bildet du vil bruke i filmen

xpos        = 22:750; %Hvilke koordinater i x-retning du ønsker å ta med
ypos        = 15:236; %Hvilke koordinater i y-retning du ønsker å ta med

%---------------------------------------------------------------------
% Sjekk at innstillinger er mulige
%---------------------------------------------------------------------

if nslutt > nFrames
    disp(' Feil: nslutt må være mindre enn antall bilder i filmen'); return;
end
if xpos(end) > vidWidth
    disp(' Feil: Største xpos må være mindre enn filmens bredde'); return;
end
if ypos(end) > vidHeight
    disp(' Feil: Største ypos må være mindre enn filmens høyde'); return;
end

%---------------------------------------------------------------------
% Initialiser nødvendige variable
%---------------------------------------------------------------------

nBilder = nslutt-nstart+1; %Antall bilder som skal analyseres

bpos_x = zeros(nBilder,1); %Ballongens posisjon i hvert bilde, x
bpos_y = zeros(nBilder,1); %Ballongens posisjon i hvert bilde, y

%---------------------------------------------------------------------
% Juster bildeegenskaper, konverter til binært format og beregn 
% massesenter.
% 
% Her kan dere selv bli nødt til å endre på enkelte faktorer for å få
% gode nok bilder.
%
% For at algoritmen som finner massesenter skal fungere, er det viktig
% at det bare er ett objekt igjen i svarthvitt-bildet.
% (Det virker også hvis ballongen alltid blir regnet som objekt 1
% av 'regionprops', men dette er det i praksis vanskelig å sikre.)
%---------------------------------------------------------------------
for i=1:nBilder
    % Les ut ett enkelt bilde fra filmen
    bilde = read(film,nstart+i-1); 
    
    % Vis bildet, hvis ønskelig
    % figure(1); imshow(bilde);
    
    % Se kun på det valgte utsnittet
    bscaled = bilde(ypos,xpos); 
    
    % Konverter til binært
    % Her kan man velge mer avanserte metoder om nødvendig, filtrere før 
    % konvertering osv. Det kan være nødvendig å endre grenseverdien.
    bwscaled = im2bw(bscaled,0.3); 
    
    % Fjern unødvendige pixler (armer, annet støy).
    % Det kan være nødvendig å endre størrelsen på disken, eventuelt
    % legge til annen filtrering.
    bwop = imopen(bwscaled,strel('disk',0));
    
    % Fjern sammenhengende områder mindre enn et antall pixler
    bwop = bwareaopen(bwop,600);
    
    % Vis ferdig bilde, hvis ønskelig
    %figure(2); imshow(bwop);
    
    % Finn massesenter for hvert bilde.
    % Skriver feilmelding, og setter posisjon til NaN hvis det ikke er
    % hvite objekter igjen i bildet.
    c = regionprops(bwop,'centroid'); 
    if size(c,1) == 0
        disp('No object in frame');
        bpos_x(i) = NaN;
        bpos_y(i) = NaN;
    elseif size(c,1) > 1
        disp('Multiple objects in frame, using object 1');
        bpos_x(i) = c(1).Centroid(1,2);
        bpos_y(i) = c(1).Centroid(1,1); 
        fprintf(1,'Mass center: %i, x=%i y=%i\n',i,bpos_x(i),bpos_y(i));
    else
        bpos_x(i) = c.Centroid(1,2);
        bpos_y(i) = c.Centroid(1,1); 
        fprintf(1,'Mass center: %i, x=%i y=%i\n',i,bpos_x(i),bpos_y(i));
    end
end

%---------------------------------------------------------------------
% Lagre resultat.
%---------------------------------------------------------------------

save('BallongPosisjon.mat','bpos_x', 'bpos_y','frameRate');
