varians=[7.7217 5.5264 4.3113 3.5624 3.0243 2.6740 2.0338 1.6542 1.2577 0.3301]; %tilhrende 10 bilder med varierende blenderapning
middelverdi=[221.2416 163.6825 131.3538 112.3096 94.2360 80.2532 61.1304 44.9945 27.4664 4.9762];

figure(1)
plot(middelverdi,varians,'*')
xlabel('Middelverdi'), ylabel('Varians'),title('Varians som funksjon av middelverdi')
grid on
figure(2)
stoy=sqrt(varians);%1./((middelverdi).^(0.5))
plot(middelverdi,middelverdi./stoy,'o')
xlabel('Middtelverdi'),ylabel('Middelverdi/støy'),title('Middelverdi/støy som funksjon av middelverdi')
grid on

figure(3),
plot(m