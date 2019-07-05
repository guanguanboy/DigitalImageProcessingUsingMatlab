%演示用开操作来进行非均匀背景的补偿
f = imread('Fig0926(a).tif');
imshow(f); %从图中可以看出，图像下部的背景比上部的黑。这种情况下，对不平坦的亮度进行阈值处理会很困难

se = strel('disk', 10);
fo = imopen(f, se);
figure, imshow(fo);
title('fo');

%把这副图像从原始图像中减去，可以生成一副拥有合适的均匀背景的米粒图像
f2 = f - fo;
figure, imshow(f2);
title('f2');

%使用imtophat()达到相同效果
g = imtophat(f, se);
figure, imshow(g);
title('g');

