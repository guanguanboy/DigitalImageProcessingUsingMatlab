%��ʾ�ÿ����������зǾ��ȱ����Ĳ���
f = imread('Fig0926(a).tif');
imshow(f); %��ͼ�п��Կ�����ͼ���²��ı������ϲ��ĺڡ���������£��Բ�ƽ̹�����Ƚ�����ֵ����������

se = strel('disk', 10);
fo = imopen(f, se);
figure, imshow(fo);
title('fo');

%���⸱ͼ���ԭʼͼ���м�ȥ����������һ��ӵ�к��ʵľ��ȱ���������ͼ��
f2 = f - fo;
figure, imshow(f2);
title('f2');

%ʹ��imtophat()�ﵽ��ͬЧ��
g = imtophat(f, se);
figure, imshow(g);
title('g');

