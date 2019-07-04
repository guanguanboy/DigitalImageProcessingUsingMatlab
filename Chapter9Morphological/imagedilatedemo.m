A = imread('Fig0906(a).tif');
imshow(A);
B = [0 1 0; 1 1 1; 0 1 0];
D = imdilate(A, B);
figure,imshow(D);