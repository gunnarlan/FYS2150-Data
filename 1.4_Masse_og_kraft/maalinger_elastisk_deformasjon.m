% Første måling
% m = 2 kg
%l2 = [9.61 9.61 9.66 9.66 9.67 9.66 9.63 9.63 9.61 9.63];
%l2 = 9 + (1-(l2 - 9)); % Leste av desimalbiten feil. Korrigerer ved aa ta 1-desimaldel  
%mean(l2)
%std(l2)*sqrt(1/(length(l2)-1))

% Kalibrering
% m = 1 g
l1 = [0.01 0.009 0.009 0.005 0.004];
m1 = repmat([1], length(l1), 1);
% m = 10 g
l10 = [0.04 0.039 0.04 0.039 0.047];
m10 = repmat([10], length(l10), 1);
% m = 100 g
l100 = [0.35 0.37 0.35 0.361 0.375];
m100 = repmat([100], length(l100), 1);
% m = 110 g
l110 = [0.405 0.42 0.405 0.42 0.42];
m110 = repmat([110], length(l110), 1);
% m = 1000 g
l1000 = [3.96 3.93 3.955 3.97 3.945];
m1000 = repmat([1000], length(l1000), 1);
% m = 1100 g
l1100 = [4.28 4.26 4.28 4.26 4.27];
m1100 = repmat([1100], length(l1100), 1);
% m = 2000 g
l2000 = [7.59 7.57 7.59 7.58 7.585];
m2000 = repmat([2000], length(l2000), 1);
% Total
l = horzcat(l1, l10, l100, l110, l1000, l1100, l2000);
m = horzcat(m1', m10', m100', m110', m1000', m1100', m2000');
df = table(m', l', 'VariableNames', {'m', 'l'});
lm = fitlm(df, 'm~l')

a = lm.Coefficients.Estimate(1);
b = lm.Coefficients.Estimate(2);
modelSd = std(l - (a+b*m))
figure(1)
plot(lm)
hold on
figure(2)
plotResiduals(lm)

% Gjor maalinger av pendellodet paa nytt
l2 = [9.255 9.245 9.25 9.27 9.29] - 1;
a + b*mean(l2)
b*std(l2)*sqrt(1/(length(l2)-1))
% Legger til en liten masse pa m = 10 g
l = [9.39 9.39 9.385 9.38 9.395]