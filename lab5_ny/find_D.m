load('maaling2.mat')
%load('Alex_tempOgVarme_16Feb2017_ulab01.mat')
T0 = max(max(T));
T1 = 0; 
start_t = 74; % s
start_i = find(and(t>=start_t-1, t<=start_t+1),1);
slutt_t = 250; % s
slutt_i = find(and(t>=slutt_t-1, t<=slutt_t+1),1);

delta_T = T0 - T1;
t = t(start_i:slutt_i) - t(start_i);
eta1 = 15e-3./sqrt(4*t);
eta2 = 29e-3./sqrt(4*t);
eta3 = 89e-3./sqrt(4*t);
eta4 = 164e-3./sqrt(4*t);
T = T(start_i:slutt_i, :);
hold on
%plot(eta1, T(:,4))
plot(eta2, T(:,3))
plot(eta3, T(:,2))
plot(eta4, T(:,1))

clf
hold on
argument=(T-T1)/(delta_T);
modified_T=erfinv(argument);
start = 50
%plot(eta1(start:end), modified_T(start:end,4), 'o')
plot(eta2(start:end), modified_T(start:end,3), 'o')
plot(eta3(start:end), modified_T(start:end,2), 'o')
plot(eta4(start:end), modified_T(start:end,1), 'o')

df2 = table(eta2(start:end)', modified_T(start:end, 3), 'VariableNames', {'eta', 't'})
df3 = table(eta3(start:end)', modified_T(start:end, 2), 'VariableNames', {'eta', 't'})
df4 = table(eta4(start:end)', modified_T(start:end, 1), 'VariableNames', {'eta', 't'})

fit2 = fitlm(df2, 't~eta')
fit3 = fitlm(df3, 't~eta')
fit4 = fitlm(df4, 't~eta')

df = table([eta2(start:end) eta3(start:end) eta4(start:end)]', ...
    [modified_T(start:end, 3)' modified_T(start:end, 2)' modified_T(start:end, 1)']', ...
    'VariableNames', {'eta', 't'});

fit = fitlm(df, 't~eta')

a = [fit2.Coefficients.Estimate(2), fit3.Coefficients.Estimate(2), ...
    fit4.Coefficients.Estimate(2)];
da = std(a)/sqrt(length(a));
dd = 2*mean(a)^-3*da
d = mean(a)^-2