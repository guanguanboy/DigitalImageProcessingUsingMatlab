%��ʾ��ɫͼ���ʸ������--��Ե���

r = imread('Fig0627(a).tif');
g = imread('Fig0627(b).tif');
b = imread('Fig0627(c).tif');

color_rgb = cat(3, r, g, b);
imshow(color_rgb);
title('color_rgb');

%�ֱ����r��g��b�������ݶ�ͼ��Ȼ��ϲ�����

%ֱ��ʹ��color_grad����������color image���ݶ�
[VG, A, PPG] = colorgrad(color_rgb);

figure, imshow(VG);
title('VG');

figure, imshow(PPG);
title('PPG');
%���Կ���PPG��ˮƽ��Ե��VG������ԭ��ܼ򵥣�����ɫƽ����ݶȲ�����һˮƽ��Եʱ��
%��ɫ����ɫƽ��ĵ�ͼ����������ֱ��Ե��Ϊ�γ�PPG������������ݶȽ�����������ˮƽ
%��Ե���ȵĴ�ֱ��Ե