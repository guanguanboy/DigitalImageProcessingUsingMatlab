%��ʾʹ�þ���任�ͷ�ˮ��任��������ָ�
%Ϊ������ˮ��任����Ҫ�ѻҶ�ͼ�������˱��棬f(x, y)��ֵ������Ϊ�߶ȡ�
%��ˮ��任���ҵ��Ҷ�ͼ���еĻ�ˮ��ܺͼ��ߡ��ڽ��ͼ��ָ����ⷽ�棬�ؼ�
%�����ǰѿ�ʼͼ���Ϊ����һ��ͼ����Щ��ˮ�����������Ҫ����Ŀ�������

%ʹ�þ���任�ķ�ˮ��ָ��Էָ���ˮ��任����ϵĳ��ù����Ǿ���任��
%��ֵͼ��ľ���任����Լ򵥵ĸ����ָ��ÿ�����ص���ӽ���ֵ�����صľ��롣
% f = imread('Fig0925(a).tif');
% imshow(f);
% 
% se = strel('disk', 5);
% g = imbinarize(f, graythresh(f));
% figure, imshow(g);
% title('g');

g = imread('Fig1026(a).tif');
imshow(g);
title('g');

gc = ~g; %��ͼ����
figure, imshow(gc);
title('~g');

D = bwdist(gc); %����任
figure, imshow(D);
title('D');

L = watershed(D); %�������任�ĸ���ˮ��任�� ��L�У����������ˮ������Ӧ����ֵָ����ˮ��ļ�������
w = (L == 0); %�õ���ˮ�뼹��ͼ��
figure, imshow(w);
title('w');

figure, imshow(~w);
title('-w');

g2 = g&~w; %��ɷָ�
figure, imshow(g2);
title('g2');

