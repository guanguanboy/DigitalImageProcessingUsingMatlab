%使用归一化互相关的方法对准下面两幅有重叠的图像
f1 = imread('Fig0521(a).tif');
f2 = imread('Fig0521(b).tif');

w = imread('Fig0520(b).tif');%Fig0520(b).tif 是之前从f1中裁剪出来的一个图片，该图片也在f2中存在

%使用normxcorr2在两幅图像中定位模板
g1 = normxcorr2(w, f1);
g2 = normxcorr2(w, f2);

%寻找g1，g2最大值所在的位置
[y1, x1] = find(g1 == max(g1(:)));
[y2, x2] = find(g2 == max(g2(:)));

%找到图像的平移
delta_x = x1 - x2;
delta_y = y1 - y2;

%构造tform仿射结构
tform = maketform('affine', [1 0 0; 0 1 0; delta_x delta_y 1]);

visreg(f1, f2, tform);
