I = imread('coins.png');

%Calculate a threshold using graythresh. The threshold is normalized to the range [0, 1].
level = graythresh(I)

%Convert the image into a binary image using the threshold.
BW = imbinarize(I,level);

%Display the original image next to the binary image.
imshowpair(I,BW,'montage')