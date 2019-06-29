I = imread('circuit.tif');
J = imrotate(I,35,'bilinear');
figure
imshowpair(I,J,'montage');
K = imrotate(I,35,'bilinear','crop');
figure
imshowpair(I,K,'montage');