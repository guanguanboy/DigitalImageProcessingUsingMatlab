%color image 图像分割演示
f = imread('Fig0630(a).tif');
imshow(f);

%下面演示，如何使用colorseg函数的两个选项对淡红色区域进行分割。
%figure, mask = roipoly(f); %select region interactively,交互式地提取感兴趣的区域

red = immultiply(mask, f(:, :, 1));
green = immultiply(mask, f(:, :, 2));
blue = immultiply(mask, f(:, :, 3));

g = cat(3, red, green, blue);
figure, imshow(g);

[M, N, K] = size(g);
I = reshape(g, M * N, 3); %重新排列g中的彩色像素，就像I的行一样
idx = find(mask); %找出彩色像素的行索引，他们不是黑的。
I = double(I(idx, 1:3));
[C, m] = covmatrix(I);

%选择阈值T，让T变为彩色分量标准差的倍数。C的主对角线包括RGB分量的方差，所以
%我们必须抽取这些元素并计算他们的平方根：
d = diag(C);
sd = sqrt(d); %sd中的第一个元素是ROI中彩色像素的红色分量的标准差，

%现在进行图像分割，以T的25倍作为阈值，这个值是最大标准差的近似：T=25.

E25 = colorseg('euclidean', f, 25, m);
figure, imshow(E25);
title('E25');

E50 = colorseg('euclidean', f, 50, m);
figure, imshow(E50);
title('E50');

E75 = colorseg('euclidean', f, 75, m);
figure, imshow(E75);
title('E75');

%综上，T等于50及75时，产生明显的过分割