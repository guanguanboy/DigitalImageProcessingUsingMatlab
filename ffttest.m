%获取图像傅里叶谱的方法
f = imread('Fig0438(a)(bld_600by600).tif');
subplot(1,2,1);
imshow(f);
%figure,imshow(f);
f = tofloat(f);
F = fft2(f);
S = fftshift(log(1 + abs(F)));
subplot(1,2,2);
imshow(S, []);
%figure,imshow(S, []);

