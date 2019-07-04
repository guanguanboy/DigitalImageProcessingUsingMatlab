f = imread('Fig0910(a).tif');
imshow(f);
se = strel('square', 40);
fo = imopen(f, se);
figure, imshow(fo);
title('imopendemo');

fc = imclose(f, se);
figure, imshow(fc);
title('imclose demo'); 

foc = imclose(fo, se);
figure, imshow(foc);
title('先开后闭');%从结果可以看出，先做开操作，再做闭操作，有平滑效果
