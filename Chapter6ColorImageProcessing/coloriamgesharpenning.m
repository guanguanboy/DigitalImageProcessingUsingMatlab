%��ɫͼ���񻯴���demo
fb = imread('Fig0625(a).tif');
imshow(fb);
lapmask = [1 1 1; 1 -8 1; 1 1 1];

fb = tofloat(fb);
fen = fb - imfilter(fb, lapmask, 'replicate');
figure, imshow(fen); %��ԭͼ�Ƚϣ���ͼ�����������������ǿ������ˮ�Ρ�Ҷ���ϵ���·��
%�����ɫ���ĺ�ǰ�������Ե���ɫֲ��
