%演示不相关信息去除的量化压缩
f = imread('Fig0810(a).tif');
imshow(f);

y = quantize(f, 16, 'igs');
figure, imshow(y);
