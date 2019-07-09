%������ʾ���ʹ��lapalace��Ե��Ϣ�Ľ�ȫ����ֵ����
f = imread('Fig1017(a).tif');
imshow(f);%��ͼ��һ����ĸϸ����8bitͼ����������ʹ��ȫ����ֵ����õ������Ӧ������
f = tofloat(f);
figure, imhist(f); %��ʾֱ��ͼ
hf = imhist(f);
[Tf, SMf] = graythresh(f);
disp(Tf); %��ʾ��ֵ
disp(SMf);%��ʾ�ɷ���
gf = im2bw(f, Tf); %ֱ��ʹ��otsu������ͼ����зָ�
figure, imshow(gf);%�ӽ�����Կ�����ֱ�ӷָ�û�дﵽ��������������Ч��

%����ʹ��lapalace����ֵ��Ե��Ϣ�����ָ��Ϊlapalace��ֵ���ݶȲ�������ֵ��ϡ�裬����ʹ�ñȽ�С�İٷֱ�
w = [-1  -1  -1
     -1  8   -1
     -1  -1  -1];
 
lap = abs(imfilter(f, w, 'replicate'));

lap = lap/max(lap(:));
figure, imhist(lap);
title('lapalace hist');

h = imhist(lap);
Q = percentile2i(h, 0.995); %ʹ��99%�ĸ߰ٷֱȹ����ݶȵ���ֵ����Ϊ����ֻ�뱣���ݶ�ͼ���еĽϴ�ֵ
%��Ϊֻ�нϴ�ֵ�����������뱳���ı߽紦;Q��ֵ�ڡ�0��1����Χ��

markerImage = lap > Q; %��Q���ݶ�ͼ������ֵ�����γɱ��ͼ��
figure, imshow(markerImage);

fp = f.*markerImage; %��f����ȡ�ݶ�ֵ��Q��ĵ㣬
figure, imshow(fp); %ͼ��fp�а���Χ�Ʊ���������߽�����أ�����fp��ֱ��ͼ��0�Ŀ���
%��Ϊ���ǵ���Ȥ��������߽���Χ�ķָ�ֵ��������Ҫ����0��ֱ��ͼ�Ĺ��ס������Ҫ��hp�ĵ�һ��Ԫ���ų�����
%Ȼ���ý��ֱ��ͼ�õ�otsu��ֵ��
title('f.*markerImage');
hp = imhist(fp); %�õ������ֱ��ͼ

hp(1)= 0; %��hp�ĵ�һ��Ԫ���ų�����
figure, bar(hp);
T = otsuthresh(hp);
threshold = T*(numel(hp) - 1);
disp(threshold); %��ֵΪ115���ɷ��Ը���
g = im2bw(f, T);
figure, imshow(g);


