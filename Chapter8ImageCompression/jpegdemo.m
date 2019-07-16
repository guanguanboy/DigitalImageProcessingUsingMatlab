%��ʾjpeg��ͼ��ѹ��
%���������ۺϵ�����ɫ���Ľ�ֹ����ѹ����׼, Joint Photographic Experts Group)��
%JPEG���������׼�ǻ�����ɢ���ұ任�ģ��ڴ����ѹ��Ӧ�����ѹ�������Ҫ��
%��������ͼ�񶼱�������8bit������ΪDCTϵ��ֵʱ����Ϊ11bit��ѹ�������4��ִ�У�
%8*8��ͼ���ȡ��DCT���㣬�����ͱ䳤�������

f = imread('Fig0804(a).tif');
imshow(f);

c1 = im2jpeg(f);
% figure, imshow(c1, []);
% title('Fig0813(a)');
f1 = jpeg2im(c1);
imratio(f, c1)
figure, imshow(f1, []);
title('Fig0813(a)'); %�⸱ͼ��ͨ��ֱ��Ӧ�÷ǹ�һ������õ���ѹ����Ϊ18��1

compare(f, f1, 3);

c4 = im2jpeg(f, 4);
f4 = jpeg2im(c4);
figure, imshow(f4, []);
title('Fig0813(b)'); %ͨ����4���Թ�һ�����������ѹ����Ϊ42��1

imratio(f, c4)

compare(f, f4, 3);