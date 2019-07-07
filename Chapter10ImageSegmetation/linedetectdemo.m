%ÑÝÊ¾Ïß¼ì²â
f = imread('Fig1004(a).tif');
imshow(f);

w = [2 -1 -1; -1 2 -1; -1 -1 2];
g = imfilter(tofloat(f), w);
figure, imshow(g, []);
title('g');
gtop = g(1:160, 1:160);
gtop = pixeldup(gtop, 4);
figure, imshow(gtop, []);
title('gtop');

gbot = g(end - 159:end, end-159:end);
gbot = pixeldup(gbot, 4);
figure, imshow(gbot, []);
title('gbot');

g = abs(g);
figure, imshow(g, []);
title('gabs');

T = max(g(:));
g = (g>=T);
figure,imshow(g)
title('g>=T');