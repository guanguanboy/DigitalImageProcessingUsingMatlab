%����ģ��ƥ�䷽������׼
%ʹ�ù����亯��normxcorr2(template, f)
f = imread('Fig0520(a).tif');
%w = imread('Fig0520(b).tif');
template = imcrop(f,[100 300 50 50]);
imwrite(template, '../DIPUM2E_International_Original_Book_Images/DIPUM2E_International_Ed_CH05_Images/Fig0520(b).tif');
w = template;
g = normxcorr2(w, f);
imshow(abs(g)); %g�ǹ�һ������ص�ͼ��;�������ĵ���ʾ����ͼ����ģ���ƥ��

gabs = abs(g);
[ypeak, xpeak] = find(gabs == max(gabs(:)));
ypeak = ypeak - (size(w, 1) - 1)/2;
xpeak = xpeak - (size(w, 2) - 1)/2;
figure,imshow(f);
hold on;
plot(xpeak, ypeak, 'wo'); %��׼������СԲȦ��ʾ
