f = imread('Fig1006(a).tif');
imshow(f);

[gv, t] = edge(f, 'sobel', 'vertical');
 
figure, imshow(gv); %从图像中可以看出结果中主要边缘是垂直边缘，倾斜的边缘有垂直和水平分量，所以也能被检测到
disp(t); %disp 这条命令的作用是在命令行窗口，输出变量的值

gv = edge(f, 'sobel', 0.15, 'vertical'); %可以指定较高的阈值，从而把较弱的边缘去掉

figure, imshow(gv);

%同时检测水平边缘和垂直边缘可以使用下式
gboth = edge(f, 'sobel', 0.15);
figure, imshow(gboth);
title('gboth');

%edge不能检测45度边缘，可以使用imfilter来进行
weg45 = [-2 -1 0;
         -1 0 1
         0 1 2];
gneg45 = imfilter(tofloat(f), weg45, 'replicate');
T = 0.3 * max(abs(gneg45(:)));
gneg45 = (gneg45>= T);
figure, imshow(gneg45);
title('-45');

%检测45度的边缘可以使用下列算子
wpos45 = [0  1  2
          -1 0  1
          -2 -1 0];
gpos45 = imfilter(tofloat(f), wpos45, 'replicate');      
T = 0.3 * max(abs(gpos45(:)));
gpos45 = (gpos45>= T);
figure, imshow(gpos45);
title('45');
      

