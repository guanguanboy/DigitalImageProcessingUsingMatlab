%演示使用距离变换和分水岭变换进行区域分割
%为了理解分水岭变换，需要把灰度图像看作拓扑表面，f(x, y)的值被解释为高度。
%分水岭变换将找到灰度图像中的汇水朋弟和脊线。在解决图像分割问题方面，关键
%概念是把开始图像变为另外一副图像，那些汇水盆地是我们想要辨别的目标或区域。

%使用距离变换的分水岭分割，针对分割，与分水岭变换相配合的常用工具是距离变换。
%二值图像的距离变换是相对简单的概念：是指从每个像素到最接近零值的像素的距离。
% f = imread('Fig0925(a).tif');
% imshow(f);
% 
% se = strel('disk', 5);
% g = imbinarize(f, graythresh(f));
% figure, imshow(g);
% title('g');

g = imread('Fig1026(a).tif');
imshow(g);
title('g');

gc = ~g; %对图像求补
figure, imshow(gc);
title('~g');

D = bwdist(gc); %距离变换
figure, imshow(D);
title('D');

L = watershed(D); %计算距离变换的负分水岭变换， 在L中，正整数与汇水盆地相对应，零值指出分水岭的脊线像素
w = (L == 0); %得到分水岭脊线图像
figure, imshow(w);
title('w');

figure, imshow(~w);
title('-w');

g2 = g&~w; %完成分割
figure, imshow(g2);
title('g2');

