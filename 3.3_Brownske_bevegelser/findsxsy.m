function findsxsy(d, file)
%d = 0.1 % [mm] Distance between the middle of lines
%file = 'gitter20x.png';
pic = imread(file);
% bw = im2bw(picture, 0.9);
normX = sum(pic)/max(sum(pic));
normY= sum(pic, 1)/max(sum(pic, 1));
% findpeaks(-normX, 'MinPeakHeight', -0.3)
[minimaX, indexX] = findpeaks(-normX, 'MinPeakHeight', -0.3);
[minimaY, indexY] = findpeaks(-normY, 'MinPeakHeight', -0.3);
% Number of pixels between consecutive minima
%disX = (indexX - circshift(indexX, [1,0]));
%disY = (indexY - circshift(indexY, [1,0]));
%disX = disX(2:end); % First index is meaningless
%disY = disY(2:end); % First index is meaningless
disX = indexX(2:end) - indexX(1:end-1)
disY = indexY(2:end) - indexY(1:end-1)
d./disX(1:end-1)
d./disY(1:end-1)
end