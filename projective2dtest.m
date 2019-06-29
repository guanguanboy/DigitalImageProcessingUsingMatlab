clc;
clear;
close all;

I = imread('lena.tif');
%设置角度
theta = 90;
% 定义投影变换的矩阵
tm = [cosd(theta) -sind(theta) 0; ...
    sind(theta) cosd(theta) 0; ...
    0 0 1];
% 生成投影变换
tform = projective2d(tm);
outputImage = imwarp(I,tform);
figure
imshow(outputImage);title('tform未使用默认值');
%测试默认值的投影变换
tform2 = projective2d;
img2 = imwarp(I,tform2);
figure;
imshow(img2);title('使用默认值'); 
%https://blog.csdn.net/Chaolei3/article/details/79532734 