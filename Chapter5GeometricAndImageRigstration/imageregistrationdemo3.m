%基于模板匹配方法的配准
%使用工具箱函数normxcorr2(template, f)
f = imread('Fig0520(a).tif');
%w = imread('Fig0520(b).tif');
template = imcrop(f,[100 300 50 50]);
imwrite(template, '../DIPUM2E_International_Original_Book_Images/DIPUM2E_International_Ed_CH05_Images/Fig0520(b).tif');
w = template;
g = normxcorr2(w, f);
imshow(abs(g)); %g是归一化互相关的图像，途中最亮的点显示出了图像与模板的匹配

gabs = abs(g);
[ypeak, xpeak] = find(gabs == max(gabs(:)));
ypeak = ypeak - (size(w, 1) - 1)/2;
xpeak = xpeak - (size(w, 2) - 1)/2;
figure,imshow(f);
hold on;
plot(xpeak, ypeak, 'wo'); %配准中心用小圆圈表示
