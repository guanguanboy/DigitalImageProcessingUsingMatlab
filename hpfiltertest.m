f = imread('Fig0313(a).tif');
subplot(1,2,1);
imshow(f);
PQ = paddedsize(size(f));
D0 = 0.05*PQ(1);
H = hpfilter('gaussian', PQ(1), PQ(2), D0);
g = dftfilt(f, H);
subplot(1,2,2);
imshow(g);