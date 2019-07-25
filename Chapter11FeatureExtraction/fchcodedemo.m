%������ʾ, ������ӵ�Ŀ���ǻ��������߽�������һ�ײ��
f = imread('Fig1103(a).tif');
imshow(f);
%���Կ����������������ϵ�����������һ���ܲ�����ı߽磬����������һ����״����ʵ���������������߽���д���ʱ
%ƽ��ͨ��ʱ����Ĵ���ʽ

h = fspecial('average', 9);
g = imfilter(f, h, 'replicate');
figure,imshow(g);

%������ֵ�����ö�ֵͼ��
gB = im2bw(g, 0.5);
figure, imshow(gB);

B = bwboundaries(gB, 'noholes');
d = cellfun('length', B);
[maxd, k] = max(d);
b = B{k};

[M N] = size(g);
g = bound2im(b, M, N);
figure, imshow(g);

%���b�����뽫ֱ�Ӳ�����С�仯�ĳ����У������һ���ͼ����״��ʾ�ǲ���Ҫ�ġ����
%��Ϊ�����һ�ֵ��ʹ����ֶΣ�����ʹ��ǰ�����۵ĺ���bsubsamp�Ա߽������ȡ����
[s, su] = bsubsamp(b, 50);

%ʹ�ô�Լ����ͼ����10%��������з��롣����������ʾΪһ��ͼ��
g2 = bound2im(s, M, N);
figure, imshow(g2);
title('g2');
%����ʹ����������ʹ֮��Ϊ��������
cn =connectpoly(s(:, 1), s(:, 2));
g3 = bound2im(cn, M, N);
figure, imshow(g3);
title('g3');