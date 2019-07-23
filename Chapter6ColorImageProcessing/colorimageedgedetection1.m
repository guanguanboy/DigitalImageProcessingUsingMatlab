%演示彩色图像边缘检测

f = imread('Fig0628(a).tif');
[VG, A, PPG] = colorgrad(f);

figure, imshow(VG);
title('VG');

figure, imshow(PPG);
title('PPG');
%以上两幅图像在市局上非常接近，因而对于这种类下的分析，每个独立分量的梯度的计算方法比较简单，一般来说
%可以接收，在其它情况下，比如准确性很重要的情况，向量方法可能是必须的。
figure,imshow(abs(PPG - VG));