%演示彩色图像的矢量处理--边缘检测

r = imread('Fig0627(a).tif');
g = imread('Fig0627(b).tif');
b = imread('Fig0627(c).tif');

color_rgb = cat(3, r, g, b);
imshow(color_rgb);
title('color_rgb');

%分别计算r，g，b分量的梯度图像，然后合并起来

%直接使用color_grad方法来计算color image的梯度
[VG, A, PPG] = colorgrad(color_rgb);

figure, imshow(VG);
title('VG');

figure, imshow(PPG);
title('PPG');
%可以看出PPG的水平边缘比VG更弱，原因很简单：当蓝色平面的梯度产生单一水平边缘时，
%红色和绿色平面的地图产生两个垂直边缘。为形成PPG，相加这三个梯度将产生两倍于水平
%边缘亮度的垂直边缘