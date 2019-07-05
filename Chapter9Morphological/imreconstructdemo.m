f = imread('Fig0922(a).tif');
imshow(f);

fe = imerode(f, ones(51, 1));
figure, imshow(fe);

fo = imopen(f, ones(51, 1));
figure, imshow(fo);
title('fe'); %�ӽ��������ֱ�����ָ��ˣ���û�а����ַ���ֱ�������ಿ��

fobr = imreconstruct(fe, f);
figure, imshow(fobr);
title('fobr'); %�ӽ���������г���ֱ�ߵ����ֱ�׼ȷ�ػָ��ˣ������������ַ���ȥ���ˡ�

g = imfill(f, 'holes');
figure, imshow(g);
title('fill holes g');

gclearborder = imclearborder(f, 4); %���ͼ�������Ե��Ӵ��Ĳ���
figure, imshow(gclearborder);
title('clear border');
