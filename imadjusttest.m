f = imread('Fig0203(a).tif');
subplot(2,3,1);
imshow(f);
g1 = imadjust(f, [0 1], [1 0]);
subplot(2,3,2);
imshow(g1);

g2 = imadjust(f, [0.5 0.75], [0, 1]);
subplot(2,3,3);
imshow(g2);

g3 = imadjust(f, [], [], 2);
subplot(2,3,4);
imshow(g3);

stretchlim(f)

g4 = imadjust(f, stretchlim(f), []);
subplot(2,3,5);
imshow(g4);

g5 = imadjust(f, stretchlim(f), [1, 0]);
subplot(2,3,6);
imshow(g5);