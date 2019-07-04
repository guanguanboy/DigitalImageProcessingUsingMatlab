%先开后闭操作的另一个例子
f = imread('Fig0911(a).tif');
imshow(f);
se = strel('square', 3);
fo = imopen(f, se);
figure, imshow(fo); %如果对图像进行开操作可以去除噪声点，但这种处理在指纹的纹脊上引入一些缺口

foc = imclose(fo,se);
figure, imshow(foc); %许多缺口可以通过开操作的闭操作来解决，但是没有完全消除

