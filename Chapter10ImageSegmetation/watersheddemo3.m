%���ڿ��Ʊ�Ƿ��ķ�ˮ��ָ�--������ָ�
f = imread('Fig1028(a).tif');
imshow(f);

%���ݶ�ͼ��
h = fspecial('sobel');
fd = tofloat(f);

g = sqrt(imfilter(fd, h, 'replicate').^2 + imfilter(fd, h', 'replicate').^2);
figure, imshow(g); %�ݶȷ���ͼ��

L = watershed(g);
wr = (L == 0);
figure, imshow(wr); %���Կ������ع��ָ���

rm = imregionalmin(g);
figure, imshow(rm);

im = imextendedmin(f, 2); %ʹ��imexrendedmin���õ��ڲ���Ǽ���

fim = f;
fim(im) = 175; %���Ұߵ����С����λ�õ�����ԭʼͼ���ϣ����Կ������õ��İߵ��ȷ�ܺ���ر����������Ҫ�ָ������
figure, imshow(fim);
title('fim');

Lim = watershed(bwdist(im)); %�����ڲ����ͼim�ľ���任�ķ�ˮ��任
em = (Lim == 0);

figure,imshow(em); %��ͼ��ʾ�˶�ֵͼ��em�еķ�ˮ�뼹�ߡ���Ϊ��Щ����λ����im��ǵİ��ߵ�֮�䣬����
%����Ӧ���Ǻܺõ��ⲿ��Ƿ�
title('em');

g2 = imimposemin(g, im | em); %ͨ�����ڲ����ⲿ��Ƿ���λ�ø��Ǿֲ���С���򣬿��ԸĽ��ݶ�ͼ��

figure, imshow(g2);
title('g2');

L2 = watershed(g2); %����Ľ��˱�Ƿ����ݶ�ͼ��ķ�ˮ��任
f2 = f;
f2(L2 == 0) = 255; %��ԭʼͼ���ϵ��ӷ�ˮ�뼹��

imshow(f2);%�ָ���
title('f2');

