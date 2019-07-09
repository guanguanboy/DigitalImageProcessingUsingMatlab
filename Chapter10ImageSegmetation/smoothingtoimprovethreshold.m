%��ʾʹ��ͼ��ƽ���Ľ�ȫ����ֵ���������Դ�����ͼ��Ĵ���
f = imread('Fig1015(a)[noiseless].tif');
fn = imnoise(f, 'gaussian', 0, 0.038);
imshow(fn);

figure, imhist(fn);

Tn = graythresh(fn);
gn = imbinarize(fn, Tn);
figure, imshow(gn);

%smooth the image and repeat
w = fspecial('average', 5);
fa = imfilter(fn, w, 'replicate');
figure, imshow(fa);
figure, imhist(fa);

Ta = graythresh(fa);
ga = imbinarize(fa, Ta);
figure, imshow(ga);
