start_10g = [9.44 9.45 9.44 9.44 9.44];
slutt_10g = [9.395 9.40 9.40 9.40 9.40];
start_100g = [9.35 9.35 9.35 9.35 9.34];
slutt_100g = [8.945 8.94 8.94 8.95 8.95];
start_500g = [9.32 9.35 9.35 9.34 9.34];
slutt_500g = [7.415 7.42 7.40 7.42 7.43];
start_1kg = [9.34 9.35 9.34 9.34 9.34];
slutt_1kg = [5.58 5.575 5.58 5.59 5.56];
start_1500g = [9.31 9.30 9.30 9.31 9.30];
slutt_1500g = [3.71 3.705 3.715 3.715 3.725];
start_2000g = [9.33 9.30 9.30 9.31 9.30];
slutt_2000g = [1.95 1.945 1.925 1.93 1.93];
start_2100g = [9.31 9.31 9.31 9.31 9.32];
slutt_2100g = [1.58 1.59 1.565 1.58 1.56];
start_lodd = [9.31 9.30 9.29 9.29 9.29];
slutt_lodd = [1.15 1.17 1.12 1.13 1.18];

l = horzcat(abs(slutt_10g - start_10g), abs(slutt_100g - start_100g), ...
abs(slutt_500g - start_500g), abs(slutt_1kg - start_1kg), ...
abs(start_1500g - slutt_1500g), ...
abs(slutt_2000g - start_2000g), abs(slutt_2100g - start_2100g));
m = horzcat(repmat([10],5,1)',repmat([100],5,1)', repmat([500],5,1)', ...
    repmat([1000],5,1)', repmat([1500],5,1)', repmat([2000],5,1)', repmat([2100],5,1)');
df = table(m', l', 'VariableNames', {'m', 'l'});
lm = fitlm(df, 'm~l')
plot(lm)

a = lm.Coefficients.Estimate(1);
b = lm.Coefficients.Estimate(2);

lodd = abs(slutt_lodd-start_lodd);
a + b*mean(lodd)
