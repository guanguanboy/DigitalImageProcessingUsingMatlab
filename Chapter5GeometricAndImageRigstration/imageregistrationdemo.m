f = imread('Fig0521(a).tif');
g = imread('Fig0521(b).tif');
%cpselect(f, g);
subplot(2,2,1),imshow(f);

subplot(2,2,2),imshow(g);

%s = load('cpselect-results');
tform = cp2tform(movingPoints, fixedPoints, 'affine');
%figure,visreg(g, f, tform);
out = imtransform(g, tform);
subplot(2,2,3), imshow(out);
