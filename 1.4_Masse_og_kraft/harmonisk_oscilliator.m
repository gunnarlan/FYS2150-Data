N = 30;
t = [12.5 12.94 12.75 12.30 13.07];
p = t/30
pm = mean(p)
sigmap = std(p)/sqrt((length(p)-1))

m = 2443.7; % Massen til loddet fra A.
dm = m*sqrt(2)* sigmap/pm

% Maalinger av lodd + 100g + teip
t2 = [13.49 14.05 14.08 13.85 13.53];

