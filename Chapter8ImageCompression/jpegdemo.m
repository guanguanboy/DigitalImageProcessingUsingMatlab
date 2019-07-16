%演示jpeg的图像压缩
%最流行且综合的连续色调的禁止画面压缩标准, Joint Photographic Experts Group)。
%JPEG基本编码标准是基于离散余弦变换的，在大多数压缩应用中已购满足需要，
%输入和输出图像都被限制在8bit，量化为DCT系数值时限制为11bit。压缩本身分4步执行：
%8*8子图像抽取，DCT计算，量化和变长编码分配

f = imread('Fig0804(a).tif');
imshow(f);

c1 = im2jpeg(f);
% figure, imshow(c1, []);
% title('Fig0813(a)');
f1 = jpeg2im(c1);
imratio(f, c1)
figure, imshow(f1, []);
title('Fig0813(a)'); %这副图像通过直接应用非归一化数组得到，压缩比为18：1

compare(f, f1, 3);

c4 = im2jpeg(f, 4);
f4 = jpeg2im(c4);
figure, imshow(f4, []);
title('Fig0813(b)'); %通过用4乘以归一化数组产生，压缩比为42：1

imratio(f, c4)

compare(f, f4, 3);