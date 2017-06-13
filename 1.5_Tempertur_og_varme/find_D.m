load('maaling2.mat')
T0 = mean(T(1:10,4));
T1 = 0; 
start_t = 80; % s
start_i = find(and(t>=start_t-1, t<=start_t+1),1);
slutt_t = 380; % s
slutt_i = find(and(t>=slutt_t-1, t<=slutt_t+1),1);

delta_T = T0 - T1;
t = t(start_i:slutt_i) - t(start_i);
eta1 = 2e-3./sqrt(4*t);
eta2 = 29e-3./sqrt(4*t);
eta3 = 89e-3./sqrt(4*t);
eta4 = 164e-3./sqrt(4*t);
T = T(start_i:slutt_i, :);
hold on
plot(eta1, T(:,4))
plot(eta2, T(:,3))
plot(eta3, T(:,2))
plot(eta4, T(:,1))

clf
hold on
argument=(T-T1)/(delta_T);
modified_T=erfinv(argument);
plot(eta1, modified_T(:,4))
plot(eta2, modified_T(:,3))
plot(eta3, modified_T(:,2))
plot(eta4, modified_T(:,1))