%��ʾʹ�þ���任�ͷ�ˮ��任��������ָ�
%Ϊ������ˮ��任����Ҫ�ѻҶ�ͼ�������˱��棬f(x, y)��ֵ������Ϊ�߶ȡ�
%��ˮ��任���ҵ��Ҷ�ͼ���еĻ�ˮ��ܺͼ��ߡ��ڽ��ͼ��ָ����ⷽ�棬�ؼ�
%�����ǰѿ�ʼͼ���Ϊ����һ��ͼ����Щ��ˮ�����������Ҫ����Ŀ�������

%ʹ�þ���任�ķ�ˮ��ָ��Էָ���ˮ��任����ϵĳ��ù����Ǿ���任��
%��ֵͼ��ľ���任����Լ򵥵ĸ����ָ��ÿ�����ص���ӽ���ֵ�����صľ��롣
f = imread('Fig0925(a).tif');
imshow(f);

se = strel('disk', 5);
fe = imerode(f, se);
fobr = imreconstruct(fe, f);

fobrc = imcomplement(fobr);
fobrce = imerode(fobrc, se);
fobrcbr = imcomplement(imreconstruct(fobrce, fobrc));

g = imbinarize(fobrcbr, graythresh(fobrcbr));
figure, imshow(g);
title('g');

% g = imread('Fig1026(a).tif');
% imshow(g);
% title('g');

gc = ~g; %��ͼ���� ͼ���󲹷���
%If I is a grayscale or RGB image of class double, you can use the expression 1-I instead of this function.
%If I is a binary image, you can use the expression ~I instead of this function.
figure, imshow(gc);
title('~g');

D = bwdist(gc); %����任
figure, imshow(D);
title('D');

L = watershed(-D); %�������任�ĸ���ˮ��任�� ��L�У����������ˮ������Ӧ����ֵָ����ˮ��ļ������أ�ΪʲôҪ����-D�����
%-D�Ļ���ԭ���ĺ�ɫ���������������Ҳ������ߺ��Σ�ԭ�������������˵����������������ָܷ������
%The watershed transform finds "catchment basins����ˮ��أ�" or "watershed ridge lines" in an image by 
%treating it as a surface where light pixels represent high elevations and dark pixels represent low elevations. 
%����L
%The elements labeled 0 do not belong to a unique watershed region. 
%The elements labeled 1 belong to the first watershed region, the elements labeled 2 belong to the second watershed region, and so on.
w = (L == 0); %�õ���ˮ�뼹��ͼ��
figure, imshow(w);
title('w');

figure, imshow(~w);
title('-w');

g2 = g&~w; %��ɷָ���Կ���ͼ��ĳЩ����û�б��ܺõķָ�ⱻ��Ϊ���ָ����ʹ�û��ڷ�ˮ��ķָ��ʱ�����ֵ�����
figure, imshow(g2);
title('g2');

