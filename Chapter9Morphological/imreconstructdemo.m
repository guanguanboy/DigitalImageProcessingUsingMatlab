f = imread('Fig0922(a).tif');
imshow(f);

fe = imerode(f, ones(51, 1));
figure, imshow(fe);

fo = imopen(f, ones(51, 1));
figure, imshow(fo);
title('fe'); %从结果看，垂直条被恢复了，但没有包含字符垂直条的其余部分

fobr = imreconstruct(fe, f);
figure, imshow(fobr);
title('fobr'); %从结果看，含有长垂直线的文字被准确地恢复了，所有其它的字符被去掉了。

g = imfill(f, 'holes');
figure, imshow(g);
title('fill holes g');

gclearborder = imclearborder(f, 4); %清除图像中与边缘相接触的部分
figure, imshow(gclearborder);
title('clear border');
