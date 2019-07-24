%color image ͼ��ָ���ʾ
f = imread('Fig0630(a).tif');
imshow(f);

%������ʾ�����ʹ��colorseg����������ѡ��Ե���ɫ������зָ
%figure, mask = roipoly(f); %select region interactively,����ʽ����ȡ����Ȥ������

red = immultiply(mask, f(:, :, 1));
green = immultiply(mask, f(:, :, 2));
blue = immultiply(mask, f(:, :, 3));

g = cat(3, red, green, blue);
figure, imshow(g);

[M, N, K] = size(g);
I = reshape(g, M * N, 3); %��������g�еĲ�ɫ���أ�����I����һ��
idx = find(mask); %�ҳ���ɫ���ص������������ǲ��Ǻڵġ�
I = double(I(idx, 1:3));
[C, m] = covmatrix(I);

%ѡ����ֵT����T��Ϊ��ɫ������׼��ı�����C�����Խ��߰���RGB�����ķ������
%���Ǳ����ȡ��ЩԪ�ز��������ǵ�ƽ������
d = diag(C);
sd = sqrt(d); %sd�еĵ�һ��Ԫ����ROI�в�ɫ���صĺ�ɫ�����ı�׼�

%���ڽ���ͼ��ָ��T��25����Ϊ��ֵ�����ֵ������׼��Ľ��ƣ�T=25.

E25 = colorseg('euclidean', f, 25, m);
figure, imshow(E25);
title('E25');

E50 = colorseg('euclidean', f, 50, m);
figure, imshow(E50);
title('E50');

E75 = colorseg('euclidean', f, 75, m);
figure, imshow(E75);
title('E75');

%���ϣ�T����50��75ʱ���������ԵĹ��ָ�