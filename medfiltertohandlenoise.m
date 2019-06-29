f = imread('F:\DigitalImageProcessingUsingMatlab\DIPUM2E_International_Original_Book_Images\DIPUM2E_International_Ed_CH04_Images\Fig0406(a)[without_noise].tif');
imshow(f);
g = imnoise(f, 'salt & pepper', .25);
figure,imshow(g);
%使用中值滤波1得到的结果，中值滤波是降低图像中椒盐噪声的一种有用工具
f1 = medfilt2(g, [7, 7], 'symmetric');
figure,imshow(f1);