obj = imread('areal.png');
[obj rect] = imcrop(obj);
for i = 1:3
    bobj = im2bw(obj(:,:,i), 0.8);
    imshow(bobj)
    pause(2)
    sum(sum(bobj))/1e3
end