%演示利用移动均值的图像阈值处理
%f = imread('Fig1019(a).tif');
f = imread('Fig1019(d).tif'); %由正旋阴影污染的图像
imshow(f);

%使用otsu‘s全局阈值处理方法分割
T = graythresh(f);
g1 = imbinarize(f, T);
figure, imshow(g1); %分割失败

%使用移动平均进行局部阈值处理
g2 = movingthresh(f, 20, 0.5);
figure, imshow(g2); %分割成功，当感兴趣的物体对于图像尺寸来说较小，较细时，
%基于移动平均的阈值处理能得到比较好的效果。通常打字或者手写文本都满足这个条件
