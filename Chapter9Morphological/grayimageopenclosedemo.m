%��ʾ�Ҷȼ�ͼ��Ŀ��ղ�����
%��������Ч����ȥ���ȽṹԪС������ϸ��
%�ղ�����Ч����ȥ���ȽṹԪС�ĺڰ�ϸ��
%���Ǿ��������һ������ƽ��ͼ��ȥ������
f = imread('Fig0925(a).tif');
imshow(f);

se = strel('disk', 5);

fo = imopen(f, se);
figure, imshow(fo);
title('fo');

foc = imclose(fo, se); %�ӽ���������ͼ��ȫ��ƽ�������ֹ���ͨ�����������˲�
figure, imshow(foc);
title('foc');

%�տ�ƽ���˲�
fc = imclose(f, se);
fco = imopen(fc, se);
figure, imshow(foc);
title('fco');

