w = ones(31);
f = imread('Fig0216(a).tif');
subplot(2,3,1);
imshow(f);
gd = imfilter(f, w);
subplot(2,3,2);
imshow(gd, [ ]);

gr = imfilter(f, w, 'replicate');
subplot(2,3,3);
imshow(gr);

gs = imfilter(f, w, 'symmetric');
subplot(2,3,4);
imshow(gs);

gc = imfilter(f, w, 'circular');
subplot(2,3,5);
imshow(gc);

f8 = im2uint8(f);
g8r = imfilter(f8, w, 'replicate');
subplot(2,3,6);
imshow(g8r, []);