%参考matlab帮助https://ww2.mathworks.cn/help/images/ref/strel.html?searchHighlight=strel&s_tid=doc_srchtitle
A = imread('Fig0908(a).tif');
imshow(A);
se = strel('disk', 10);
se.Neighborhood %View the structuring element.这条命令用来观察结构元
%figure,imshow(se.Neighborhood); %显示结构元
E10 = imerode(A, se);
figure, imshow(E10);
title('E10');
%选择太小的结构元
se = strel('disk', 5);
E5 = imerode(A, se);
figure,imshow(E5);
title('E5');

%选择太大的结构元
se = strel('disk', 20);
E20 = imerode(A, se);
figure,imshow(E20);
title('E20');