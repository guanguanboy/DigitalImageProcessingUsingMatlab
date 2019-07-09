%ʹ�û����ݶȵı�Ե��Ϣ�Ľ���ֵ����
f = imread('Fig1016(a).tif');
f = tofloat(f);
imshow(f);
figure, imhist(f); %ֱ��ͼ�ǵ���ģ�����������£�Ԥ��ȫ����ֵ������ʧ��
%������ȱ���С�ö�ʱ�����Ƕ�ֱ��ͼ�ù��׿��Ժ��Բ��ơ�ʹ�ñ�Ե��Ϣ���ԸĽ��������

%�����ݶ�ͼ��
sx = fspecial('sobel');
sy = sx';
gx = imfilter(f, sx, 'replicate');
gy = imfilter(f, sy, 'replicate');

grad = sqrt(gx.*gx + gy.*gy);
grad = grad/max(grad(:)); %��grad��ֵ��һ������ȷ��{0�� 1}��Χ��
figure, imshow(grad);

h = imhist(grad); %�õ�grad��ֱ��ͼ
Q = percentile2i(h, 0.999); %ʹ��99%�ĸ߰ٷֱȹ����ݶȵ���ֵ����Ϊ����ֻ�뱣���ݶ�ͼ���еĽϴ�ֵ
%��Ϊֻ�нϴ�ֵ�����������뱳���ı߽紦;Q��ֵ�ڡ�0��1����Χ��

markerImage = grad > Q; %��Q���ݶ�ͼ������ֵ�����γɱ��ͼ��
figure, imshow(markerImage);

fp = f.*markerImage; %��f����ȡ�ݶ�ֵ��Q��ĵ㣬
figure, imshow(fp); %ͼ��fp�а���Χ�Ʊ���������߽�����أ�����fp��ֱ��ͼ��0�Ŀ���
%��Ϊ���ǵ���Ȥ��������߽���Χ�ķָ�ֵ��������Ҫ����0��ֱ��ͼ�Ĺ��ס������Ҫ��hp�ĵ�һ��Ԫ���ų�����
%Ȼ���ý��ֱ��ͼ�õ�otsu��ֵ��
hp = imhist(fp); %�õ������ֱ��ͼ

hp(1)= 0; %��hp�ĵ�һ��Ԫ���ų�����
figure, bar(hp);
T = otsuthresh(hp);
T*(numel(hp) - 1)

g = im2bw(f, T);
figure, imshow(g);
