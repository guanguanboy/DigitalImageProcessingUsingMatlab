%�ο�matlab����https://ww2.mathworks.cn/help/images/ref/strel.html?searchHighlight=strel&s_tid=doc_srchtitle
A = imread('Fig0908(a).tif');
imshow(A);
se = strel('disk', 10);
se.Neighborhood %View the structuring element.�������������۲�ṹԪ
%figure,imshow(se.Neighborhood); %��ʾ�ṹԪ
E10 = imerode(A, se);
figure, imshow(E10);
title('E10');
%ѡ��̫С�ĽṹԪ
se = strel('disk', 5);
E5 = imerode(A, se);
figure,imshow(E5);
title('E5');

%ѡ��̫��ĽṹԪ
se = strel('disk', 20);
E20 = imerode(A, se);
figure,imshow(E20);
title('E20');