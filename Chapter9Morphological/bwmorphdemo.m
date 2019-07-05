%演示工具箱函数bwmorph，该函数执行许多以膨胀、腐蚀和查表运算相结合为基础的形态学操作
%调用语法为g = bwmorph(f, operation, n); f
%是输入的二值图像，operation是指定所希望运算的字符串，n是指定重复此时的正整数。如果参数n默认，
%操作将只执行一次
%下面主要演示细化和骨骼化
%细化：细化没有洞的物体到最低限度相连的笔画；将物体细化成带洞的环形
%骨骼化：骨骼化图像,另一种减少二值图像中的物体为一组细“笔画”的方法，这些细骨骼仍保留原始物体形状的重要信息。

f = imread('Fig0911(c).tif');
imshow(f);
g1 = bwmorph(f, 'thin', 1); %细化一次
g2 = bwmorph(f, 'thin', 2); %细化两次

figure, imshow(g1);
figure, imshow(g2);

ginf = bwmorph(f, 'thin', Inf); %Inf,表示使得函数重复操作直到图像停止改变，也被称作重复操作直到稳定
figure, imshow(ginf);

