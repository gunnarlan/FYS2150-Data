%% Oppgave 1
% Hvit skjerm er plassert i 147.5 cm
% Beveger 200 mm lens in order to find a sharp image

%%Shadow pattern&Magnification
dhi=[15.97 15.96 15.15.91]*1e-3 %Horizontal inner diameter of shadow pattern
dvi=[15.23 15.84 15.81]*1e-3 %Vertical inner diameter of shadow pattern
dho=[50.34 49.73 49.44]*1e-3 %Horizontal outer diameter of shadow pattern
dvo=[49.27 49.17 49.88]*1e-3 %Vertical outer diameter of shadow pattern

%%Plane at 147.5 cm
p1 = [23.4 23.3] % cm
% It is unsharp in
dP1 = [23.8 23.3]
% Moving the lense again to find the second sharp point
p2 = [123.8 123.7]
dP2 = [123.4 123.9]
%%Shadow pattern&Magnification
dhi=[15.97 15.96 15.15.91]*1e-3 %Horizontal inner diameter of shadow pattern
dvi=[15.23 15.84 15.81]*1e-3 %Vertical inner diameter of shadow pattern
dho=[50.34 49.73 49.44]*1e-3 %Horizontal outer diameter of shadow pattern
dvo=[49.27 49.17 49.88]*1e-3 %Vertical outer diameter of shadow pattern

dclosesth=[83.96 82.29 84.14 ]*1e-3  %23.3 cm, horizontal, inner
dclosestv=[82.50 83.32 82.01 ]*1e-3  %23.3 cm, vertical, inner

dfurthesth=[10.09 10.60 10.58 ]*1e-3 %123.8 cm, horizontal, outer 
dfurthestv=[9.65 9.85 9.63 ]*1e-3 %123.8 cm, vertical, outer

%%Plane at 95.0 cm
p1 = [28.0 27.9]
% It is unsharp in
dP1 = [27.6 28.3]
% Moving the lense again to find the second sharp point
p2 = [66.2 66.3] % cm
% It is unsharp in
dP2 = [65.9 66.6]

dclosesth=[37.76 38.09 37.83]*1e-3  %27.9 cm, horizontal, inner
dclosestv=[36.74 36.06 36.84]*1e-3  %27.9 cm, vertical, inner

dfurthesth=[22.11 22.17 22.27]*1e-3 %66.2 cm, horizontal, outer 
dfurthestv=[21.40 21.21 21.08 ]*1e-3 %66.2 cm, vertical, outer

%%Radius of curvature 200mm lens, measuring against standard 7
% Mitutoyo No. 2046S dial gauge
% Spherometer Stock No. 53-589 Edmund Optics | Worldwide
% Using standard #7 as reference
% Using head-6 ID=24mm OD=28mm

standard7Start = [0.27 0.27 0.27]
linseSlutt = [0.61 0.62 0.62]

%%% Experiment 2
% Lens 100 mm
% The light diode is placed 2.5 cm
% The lens is placed at 10.0
% We observe that the lysbunt grows and diverges as the screen moves
% outwards.
% When the lens is at a distance of 14.7 cm, the lysbunt remains constant
% regardless of the position of the screen. This was also observed between
% 14.5-14.8 cm.
% When the lens is at a distance of 9.1 cm, the lysbunt diverges
% When the lens is at a distance of 20.0 cm, the lysbunt converges, focues
% at a point and finally diverges.
% Oppgave 7 
% Distance 27.1 cm
% The lysbunt converges at a point as the screen moves, but this point
% contains reflections and other noise from the diode itself. Further
% movement of the screen results in the divergence of the lysbunt
% Oppgave 8
% By placing the light source right behind the brennpunkt of the lense, the
% beam will be near parallel, but will eventually converge at a single
% point limited by diffraction a long distance away.
%   .- /\---------
% o---|  |-------  Near-parallel beams
%   .- \/---------
%^Source ^Lens

%%% Experiment 3
% Oppgave 1
% In the beginning, the red and green light nearly overlap creating yellow light,
% but the image on the screen is opposite of the light sources themselves.
% That is, the green diode is to the left of the red diode, but the green
% light is to the right of the red light on the screen. When moving the
% screen, the images diverge, with the green light becoming smaller than
% the red light (small effect).
% Oppgave 2
% The image through the lense is enlarged, but the field of view is
% narrowed. This is because the 
%Oppgave 3

% Using 50 mm lense
% Lens at 10.0 cm
% CORRECTION: The diode is at +3.0 cm while the lens is at +0.9 cm relative
% to the measured distances
lens50 = [30.2; 
        44.4;
        54.6]  % Position of plane cm
beam50 = [22.06 22.15 22.17;
          46.78 45.43 46.63;
          63.63 63.08 64.13] % Width between centers of the light beams
beam50 = mean(beam50,2) % Take the row-wise mean 
% This gives an angle of


% Using 100 mm lens
% Lens at 14.7
lens100 = [44.7; 63.2; 86.5]
beam100 = [27.28 26.78 28.68;
           39.63 37.66 36.33;
           52.01 53.69 52.03
    ]
beam100 = mean(beam100,2)
% Which gives an angle of

%%%Experiment 5
%Time er 23 - setter time til ca. +20%=28
blender = [1.8 2.8 4 8 16]  %Valgte blenderaapninger

