%��ʾ��ʹ��������˹���ӽ��е���
w = [-1 -1 -1; -1 8 -1; -1 -1 -1];
f = imread('Fig1002(a).tif');
imshow(f);

g = abs(imfilter(tofloat(f), w));
T = max(g(:));
g = g >= T;
figure, imshow(g);