%imnoise demo
f = imread('cameraman.tif');

%fnoise = imnoise(f, 'gaussian'); %增加均值为0， 方差为0.01得噪声
fnoise = imnoise(f, 'gaussian', 128); %增加均值为2， 方差为0.01得噪声
%fnoise = imnoise(f, 'gaussian', 0, 0.09); %增加均值为0， 方差为1得噪声
figure, imshow(fnoise);

noise = fnoise - f;

figure, imshow(noise);
y = noise;

%figure, hist(noise);
ymin=min(y);
ymin = min(ymin(:));
ymin = ymin(1, 1);
ymin = single(ymin);
ymax=max(y);
ymax = max(ymax(:));
ymax = ymax(1, 1);
ymax = single(ymax);
x=linspace(ymin,ymax,20);%将最大最小区间分成20个等分点(19等分),然后分别计算各个区间的个数
yy=hist(y,x);%计算各个区间的个数

yy=yy/length(y);%计算各个区间的个数
figure, bar(x,yy)%画出概率密度分布图