%�Ƚ�canny��sobel��log��Ե������ӵ�����
f = imread('Fig1006(a).tif');
f = tofloat(f);

[gSobel_default, ts] = edge(f, 'sobel');
[gLoG_default, tlog] = edge(f, 'log');
[gCanny_default, tCanny] = edge(f, 'canny');

figure, imshow(gSobel_default);
title('gSobel_default');
figure, imshow(gLoG_default);
title('gLoG_default');
figure, imshow(gCanny_default);
title('gCanny_default');

%����������ͼ���Կ�����ʹ��Ĭ��ֵ����ó���ͼ������Ҫ�ó���������Եͼ����Զ
gSobel_best = edge(f, 'sobel', 0.05);
gLoG_best = edge(f, 'log', 0.003, 2.25);
gCanny_best = edge(f, 'canny', [0.04, 0.10], 1.5);

figure, imshow(gSobel_best);
title('gSobel_best');
figure, imshow(gLoG_best);
title('gLoG_best');
figure, imshow(gCanny_best);
title('gCanny_best');