f = imread('Fig0910(a).tif');
imshow(f);
se = strel('square', 40);
fo = imopen(f, se);
figure, imshow(fo);
title('imopendemo');

fc = imclose(f, se);
figure, imshow(fc);
title('imclose demo'); 

foc = imclose(fo, se);
figure, imshow(foc);
title('�ȿ����');%�ӽ�����Կ����������������������ղ�������ƽ��Ч��
