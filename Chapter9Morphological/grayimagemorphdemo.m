f = imread('Fig0923(a).tif');
imshow(f);

se = strel('square', 3);
gd = imdilate(f, se); %����֮��ͼ��ģ����һЩ
figure, imshow(gd);

ge = imerode(f, se);
figure, imshow(ge);

morph_grad = gd - ge; %��ͼ������ͽ���м�ȥ��ʴ����ͼ��ɲ�������̬ѧ�ݶȡ�
figure, imshow(morph_grad); %��̬ѧ�ݶ�ͼ���б�Ե��ǿ����


