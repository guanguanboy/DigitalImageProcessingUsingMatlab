%��ʾ�������Ϣȥ��������ѹ��
f = imread('Fig0810(a).tif');
imshow(f);

y = quantize(f, 16, 'igs');
figure, imshow(y);
