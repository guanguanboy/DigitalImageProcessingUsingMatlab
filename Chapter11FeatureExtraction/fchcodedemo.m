%链码演示, 这个例子的目的是获得物体外边界的链码和一阶差分
f = imread('Fig1103(a).tif');
imshow(f);
%可以看到，依附在物体上的噪声将导致一条很不规则的边界，它不是物体一般形状的真实描述。当对噪声边界进行处理时
%平滑通常时最常见的处理方式

h = fspecial('average', 9);
g = imfilter(f, h, 'replicate');
figure,imshow(g);

%经过阈值处理获得二值图像
gB = im2bw(g, 0.5);
figure, imshow(gB);

B = bwboundaries(gB, 'noholes');
d = cellfun('length', B);
[maxd, k] = max(d);
b = B{k};

[M N] = size(g);
g = bound2im(b, M, N);
figure, imshow(g);

%获得b的链码将直接产生较小变化的长序列，这对于一般的图像形状表示是不必要的。因此
%作为链码的一种典型处理手段，可以使用前面讨论的函数bsubsamp对边界进行子取样：
[s, su] = bsubsamp(b, 50);

%使用大约等于图像宽度10%的网格进行分离。结果点可以显示为一幅图像，
g2 = bound2im(s, M, N);
figure, imshow(g2);
title('g2');
%或者使用以下命令使之称为连接序列
cn =connectpoly(s(:, 1), s(:, 2));
g3 = bound2im(cn, M, N);
figure, imshow(g3);
title('g3');