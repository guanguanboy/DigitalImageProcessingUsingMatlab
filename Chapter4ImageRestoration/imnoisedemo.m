%imnoise demo
f = imread('cameraman.tif');

%fnoise = imnoise(f, 'gaussian'); %���Ӿ�ֵΪ0�� ����Ϊ0.01������
fnoise = imnoise(f, 'gaussian', 128); %���Ӿ�ֵΪ2�� ����Ϊ0.01������
%fnoise = imnoise(f, 'gaussian', 0, 0.09); %���Ӿ�ֵΪ0�� ����Ϊ1������
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
x=linspace(ymin,ymax,20);%�������С����ֳ�20���ȷֵ�(19�ȷ�),Ȼ��ֱ�����������ĸ���
yy=hist(y,x);%�����������ĸ���

yy=yy/length(y);%�����������ĸ���
figure, bar(x,yy)%���������ܶȷֲ�ͼ