B1 = strel([0 0 0; 0 1 1; 0 1 0]);
B2 = strel([1 1 1; 1 0 0; 1 0 0]);

 f = imread('Fig0913(a).tif');
 imshow(f);
 g = bwhitmiss(f, B1, B2);
 
 figure, imshow(g);
