%w = fspecial('laplacian', 0);
f = imread('.\DIPUM2E_International_Ed_CH02_Images\Fig0217(a).tif');
figure,imshow(f);
w = [0 1 0; 1 -4 1; 0 1 0];
g1 = imfilter(f, w, 'replicate');
figure,imshow(g1, [ ]); %If you specify an empty matrix ([]), then imshow uses a display range of [min(I(:)) max(I(:))]. In other words, the minimum value in I is black, and the maximum value is white.
f2 = double(f);
g2 = imfilter(f2, w, 'replicate');
figure, imshow(g2, [ ])

g = f2 - g2;
figure, imshow(g,[ ]);

w8 = [1 1 1; 1 -8 1; 1 1 1];
g8 = f - imfilter(f, w8, 'replicate');
figure, imshow(g8, []);

