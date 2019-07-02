%ʹ�ù�һ������صķ�����׼�����������ص���ͼ��
f1 = imread('Fig0521(a).tif');
f2 = imread('Fig0521(b).tif');

w = imread('Fig0520(b).tif');%Fig0520(b).tif ��֮ǰ��f1�вü�������һ��ͼƬ����ͼƬҲ��f2�д���

%ʹ��normxcorr2������ͼ���ж�λģ��
g1 = normxcorr2(w, f1);
g2 = normxcorr2(w, f2);

%Ѱ��g1��g2���ֵ���ڵ�λ��
[y1, x1] = find(g1 == max(g1(:)));
[y2, x2] = find(g2 == max(g2(:)));

%�ҵ�ͼ���ƽ��
delta_x = x1 - x2;
delta_y = y1 - y2;

%����tform����ṹ
tform = maketform('affine', [1 0 0; 0 1 0; delta_x delta_y 1]);

visreg(f1, f2, tform);
