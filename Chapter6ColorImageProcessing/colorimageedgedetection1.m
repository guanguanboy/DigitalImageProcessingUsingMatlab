%��ʾ��ɫͼ���Ե���

f = imread('Fig0628(a).tif');
[VG, A, PPG] = colorgrad(f);

figure, imshow(VG);
title('VG');

figure, imshow(PPG);
title('PPG');
%��������ͼ�����о��Ϸǳ��ӽ�����������������µķ�����ÿ�������������ݶȵļ��㷽���Ƚϼ򵥣�һ����˵
%���Խ��գ�����������£�����׼ȷ�Ժ���Ҫ��������������������Ǳ���ġ�
figure,imshow(abs(PPG - VG));