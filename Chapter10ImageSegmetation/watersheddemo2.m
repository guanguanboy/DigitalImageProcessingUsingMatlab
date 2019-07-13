%演示使用梯度的分水岭分割
f = imread('Fig1027(a).tif');
imshow(f);

%求梯度图像
h = fspecial('sobel');
fd = tofloat(f);

g = sqrt(imfilter(fd, h, 'replicate').^2 + imfilter(fd, h', 'replicate').^2);
figure, imshow(g, []); %梯度幅度图像
title('梯度图像');
L = watershed(g);
wr = (L == 0);

figure, imshow(wr, []); %分割后的图像，可以看到分割结果不太好，有太多的与我们感兴趣的
%物体边界不相对应的分水岭脊线。这是过分割的另一个例子，针对这一问题的解决方法是在计算分水岭变换之前先平滑梯度图像
title('过分割的分水岭变换');
%g2 = imclose(imopen(g, ones(3,3)), ones(3,3)); %使用开闭操作平滑梯度图像
%g2 = imclose(g, ones(3,3));
%g2 = imopen(imclose(g, ones(3,3)), ones(3,3));

% se = strel('disk', 25);
% g2 = imclose(imopen(g, se), se);

haverage = fspecial('average', 50);
g2 = imfilter(g, haverage, 'replicate');
L2 = watershed(g2);

wr2 = (L2 == 0);
figure, imshow(wr2,[]);
title('wr2');

f2 = f;
f2(wr2) = 255; %在原始图像上添加分水岭脊线
figure, imshow(f2, []);  
title(f2);