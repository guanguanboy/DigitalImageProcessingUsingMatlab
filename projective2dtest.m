clc;
clear;
close all;

I = imread('lena.tif');
%���ýǶ�
theta = 90;
% ����ͶӰ�任�ľ���
tm = [cosd(theta) -sind(theta) 0; ...
    sind(theta) cosd(theta) 0; ...
    0 0 1];
% ����ͶӰ�任
tform = projective2d(tm);
outputImage = imwarp(I,tform);
figure
imshow(outputImage);title('tformδʹ��Ĭ��ֵ');
%����Ĭ��ֵ��ͶӰ�任
tform2 = projective2d;
img2 = imwarp(I,tform2);
figure;
imshow(img2);title('ʹ��Ĭ��ֵ'); 
%https://blog.csdn.net/Chaolei3/article/details/79532734 