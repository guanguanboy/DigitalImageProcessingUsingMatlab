%�ȿ���ղ�������һ������
f = imread('Fig0911(a).tif');
imshow(f);
se = strel('square', 3);
fo = imopen(f, se);
figure, imshow(fo); %�����ͼ����п���������ȥ�������㣬�����ִ�����ָ�Ƶ��Ƽ�������һЩȱ��

foc = imclose(fo,se);
figure, imshow(foc); %���ȱ�ڿ���ͨ���������ıղ��������������û����ȫ����

