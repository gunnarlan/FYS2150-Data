clc
clear
video = VideoReader('7_group_A_d_22k05_m_26k50_M_gummi_trial_1.avi');
%video = VideoReader('7_group_B_d_19k05_m_28k11_M_metall_trial_2.avi');

%A = images - referenceImage;
A = read(video);
T = 1./video.FrameRate
i = 1;
j = 75;

yrange = 216:1750;
xrange = 56:242;
img_i = read(video, i);
img_i = img_i(xrange, yrange);
img_j = read(video, j); 
img_j = img_j(xrange, yrange);

subplot(411)
imshow(img_i)
subplot(412)
imshow(img_j)
subplot(413)
imshow(img_i- img_j)
subplot(414)
line = sum(img_i- img_j);
[v,ind] = max(line)
plot(line)
%%
% For maalestokk
Startpiksel = 67;
Sluttpiksel = 2030;
mpp = 2/(2030-67);

navn = '7_group_D_d_22k05_m_31k44_M_gummi_trial_1.avi';
tokens = regexp(navn,'_d_(\d+)k(\d+)', 'tokens');
d = str2num(cell2mat(tokens{1}(1))) + str2num(cell2mat(tokens{1}(2)))*1e-2;
tokens = regexp(navn,'_m_(\d+)k(\d+)', 'tokens');
m = str2num(cell2mat(tokens{1}(1))) + str2num(cell2mat(tokens{1}(2)))*1e-2;
tokens = regexp(navn,'_M_(.*?)_', 'tokens');
materiale = tokens{1}

video = VideoReader(navn);
A = read(video);

yrange = 216:1750;
xrange = 56:242;
A = A(xrange, yrange, :,:,:);
N = size(A);
N = N(end);
Xs = zeros(N, 1);
Ys = zeros(N, 1);
mXs = zeros(N, 1);
mYs = zeros(N, 1);
failureCounter = 0;

startIndex = -1;
stopIndex = 1;

for i = 2:1:N
    grayA = rgb2gray(A(:,:,:,2)-A(:,:,:,i));
    bobj = im2bw(grayA,0.3);
    B = bwlabel(bobj, 4);
    % Find center of mass
    C = regionprops(B, 'centroid');
    if sum(size(C) == [1 1]) == 2
        stopIndex = i;
        Xs(i) = C.Centroid(1,1);
        Ys(i) = C.Centroid(1,2);
        
        if startIndex < 0
            startIndex = i;
        end
    elseif sum(size(C) == [2 1]) == 2
        failureCounter = failureCounter + 1;
    end
    
    [value mXs(i)] = max(sum(grayA));
    [value mYs(i)] = max(sum(grayA,2));
end
failureCounter
figure(1)
imshow(bobj)
hold on
plot(Xs, Ys, 'o')

t = linspace(0,1/video.FrameRate*N,N);

% Position
fig2 = figure(2);
subplot(211)
Xs = Xs*mpp;
Ys = Ys*mpp;
mXs = mXs*mpp;
mYs = mYs*mpp;
plot(t, mXs, '+')
hold on
plot(t, Xs, 'o')
title('Coordinates of mass-center')
xlabel('t [s]'); ylabel('x [m]')
subplot(212)
plot(t, Ys, 'o')
hold on
plot(t, mYs, '+')
xlabel('t [s]'); ylabel('y [m]')
saveas(fig2, sprintf('%s_%s.png', navn, 'cm'))

% Velocity
figure(3)
Vs = (circshift(Xs,1)-Xs)*video.FrameRate;   % Differentiate
plot(t(startIndex:stopIndex), Vs(startIndex:stopIndex), 'o')
hold on
%plot(t, Xs, 'o')
title('Coordinates of mass-center')
xlabel('t [s]'); ylabel('v_x [m/s]')
% subplot(212)
% plot(t, Ys, 'o')
% hold on
% %plot(t, mYs, '+')
% xlabel('t [s]'); ylabel('y [m]')
% saveas(fig2, sprintf('%s_%s.png', navn, 'cm'))
