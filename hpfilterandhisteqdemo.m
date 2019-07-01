f = imread('Fig0319(a).tif');
imshow(f);
D0 = 0.05*PQ(1);
HBW = hpfilter('btw', PQ(1), PQ(2), D0, 2);
H = 0.5 + 2*HBW;
%高通滤波
gbw = dftfilt(f, HBW, 'fltpoint');
gbw = gscale(gbw);
figure, imshow(gbw); 

%强调高通滤波
ghf = dftfilt(f, H, 'fltpoint');
ghf = gscale(ghf);
figure, imshow(ghf);

%直方图均衡化
ghe = histeq(ghf, 256);
figure, imshow(ghe);

