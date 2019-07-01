f = imread('Fig0319(a).tif');
imshow(f);
D0 = 0.05*PQ(1);
HBW = hpfilter('btw', PQ(1), PQ(2), D0, 2);
H = 0.5 + 2*HBW;
%��ͨ�˲�
gbw = dftfilt(f, HBW, 'fltpoint');
gbw = gscale(gbw);
figure, imshow(gbw); 

%ǿ����ͨ�˲�
ghf = dftfilt(f, H, 'fltpoint');
ghf = gscale(ghf);
figure, imshow(ghf);

%ֱ��ͼ���⻯
ghe = histeq(ghf, 256);
figure, imshow(ghe);

