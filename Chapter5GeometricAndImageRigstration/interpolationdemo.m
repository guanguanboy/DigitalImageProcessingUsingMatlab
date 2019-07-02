f = imread('Fig0517(a).tif');
imshow(f);
figure, imshow(reprotate(f, 'nearest'));
figure, imshow(reprotate(f, 'bilinear'));
figure, imshow(reprotate(f, 'bicubic'));