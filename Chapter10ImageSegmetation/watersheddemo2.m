%��ʾʹ���ݶȵķ�ˮ��ָ�
f = imread('Fig1027(a).tif');
imshow(f);

%���ݶ�ͼ��
h = fspecial('sobel');
fd = tofloat(f);

g = sqrt(imfilter(fd, h, 'replicate').^2 + imfilter(fd, h', 'replicate').^2);
figure, imshow(g); %�ݶȷ���ͼ��

L = watershed(g);
wr = (L == 0);

figure, imshow(wr); %�ָ���ͼ�񣬿��Կ����ָ�����̫�ã���̫��������Ǹ���Ȥ��
%����߽粻���Ӧ�ķ�ˮ�뼹�ߡ����ǹ��ָ����һ�����ӣ������һ����Ľ���������ڼ����ˮ��任֮ǰ��ƽ���ݶ�ͼ��

%g2 = imclose(imopen(g, ones(3,3)), ones(3,3)); %ʹ�ÿ��ղ���ƽ���ݶ�ͼ��
%g2 = imclose(g, ones(3,3));
L2 = watershed(g2);

wr2 = (L2 == 0);
figure, imshow(wr2);
title('wr2');

f2 = f;
f2(wr2) = 255; %��ԭʼͼ������ӷ�ˮ�뼹��
figure, imshow(f2);  
title(f2);