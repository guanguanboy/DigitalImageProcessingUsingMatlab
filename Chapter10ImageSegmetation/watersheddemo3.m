%基于控制标记符的分水岭分割--解决过分割
f = imread('Fig1028(a).tif');
imshow(f);

%求梯度图像
h = fspecial('sobel');
fd = tofloat(f);

g = sqrt(imfilter(fd, h, 'replicate').^2 + imfilter(fd, h', 'replicate').^2);
figure, imshow(g); %梯度幅度图像

L = watershed(g);
wr = (L == 0);
figure, imshow(wr); %可以看到严重过分割了

rm = imregionalmin(g);
figure, imshow(rm);

im = imextendedmin(f, 2); %使用imexrendedmin来得到内部标记集合

fim = f;
fim(im) = 175; %将灰斑点的最小区域位置叠加在原始图像上，可以看到，得到的斑点的确很合理地标记了我们想要分割的物体
figure, imshow(fim);
title('fim');

Lim = watershed(bwdist(im)); %计算内部标记图im的距离变换的分水岭变换
em = (Lim == 0);

figure,imshow(em); %该图显示了二值图像em中的分水岭脊线。因为这些脊线位于由im标记的暗斑点之间，所以
%他们应该是很好的外部标记符
title('em');

g2 = imimposemin(g, im | em); %通过在内部和外部标记符的位置覆盖局部最小区域，可以改进梯度图像

figure, imshow(g2);
title('g2');

L2 = watershed(g2); %计算改进了标记符的梯度图像的分水岭变换
f2 = f;
f2(L2 == 0) = 255; %在原始图像上叠加分水岭脊线

imshow(f2);%分割结果
title('f2');

