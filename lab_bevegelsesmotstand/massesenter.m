function [x,y] = massesenter(filename)
obj = imread(filename);
bobj = im2bw(obj, 0.8);

B = bwlabel(bobj, 4);
c = regionprops(B, 'centroid');
x = c.Centroid(1,1);
y = c.Centroid(1,2);
