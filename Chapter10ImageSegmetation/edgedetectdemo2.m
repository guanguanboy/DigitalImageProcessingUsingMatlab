%比较canny，sobel，log边缘检测算子的性能
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

%从以上三张图可以看出，使用默认值计算得出的图像与想要得出的清晰边缘图相差较远
gSobel_best = edge(f, 'sobel', 0.05);
gLoG_best = edge(f, 'log', 0.003, 2.25);
gCanny_best = edge(f, 'canny', [0.04, 0.10], 1.5);

figure, imshow(gSobel_best);
title('gSobel_best');
figure, imshow(gLoG_best);
title('gLoG_best');
figure, imshow(gCanny_best);
title('gCanny_best');