t = [1.57 1.66 1.54 1.55 1.54 1.58 1.48 1.53 1.62 1.41 1.62 1.40 1.59 1.58 1.51 1.60 1.58 1.48 1.55 1.50 1.50 1.62 1.55 1.57 1.51 1.59 1.50 1.57 1.50 1.52 1.57 1.55 1.50 1.54 1.51 1.36 1.54 1.58 1.51 1.57 1.39 1.67 1.72];
hist(t, 20)
title('Time taken for one pendulum period')
xlabel('Time, t [s]')
ylabel('Absolute Frequency')
mean(t)
std(t)/sqrt(length(t))
p