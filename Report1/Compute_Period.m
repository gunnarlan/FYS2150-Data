title('Period of oscillation for large amplitude and a sampling frequency of 25000 Hz');
hold on;
ylabel('Period of pendulum, t [s]');
xlabel('Time elapsed [s]');
x=linspace(0, 180, length(periods));
plot(x', periods, '*');

