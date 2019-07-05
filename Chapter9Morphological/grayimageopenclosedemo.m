%演示灰度级图像的开闭操作，
%开操作的效果是去除比结构元小的明亮细节
%闭操作的效果是去除比结构元小的黑暗细节
%他们经常组合在一起，用来平滑图像并去掉噪声
f = imread('Fig0925(a).tif');
imshow(f);

se = strel('disk', 5);

fo = imopen(f, se);
figure, imshow(fo);
title('fo');

foc = imclose(fo, se); %从结果看这个歌图像全部平滑，这种过程通常叫做开闭滤波
figure, imshow(foc);
title('foc');

%闭开平滑滤波
fc = imclose(f, se);
fco = imopen(fc, se);
figure, imshow(foc);
title('fco');

