f = imread('Fig0318(a).tif');
imshow(f);
PQ = paddedsize(size(f));
D0 = 0.05*PQ(1);
H = hpfilter('gaussian', PQ(1), PQ(2), D0);
g = dftfilt(f, H);
figure, imshow(g);

%¸ßÆµµ¥µ÷ÂË²¨
H1 = 0.5 + 2 * H;
i = dftfilt(f, H1);
figure, imshow(i);