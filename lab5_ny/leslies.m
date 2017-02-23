Res = [36458 34991 33591 32253 30976 29756 28590 27475 26409 25390 ...
    24415 23483 22590 21736 20919 20136 19386 18668 17980 17321 16689];
Temp = linspace(48,68,68-48+1);
df = table(Res', Temp', 'VariableNames', {'Resistance', 'Temperature'});
lm = fitlm(df, 'Temperature~Resistance^2')
plot(lm)