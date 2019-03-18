 f = imread('Fig0424(a)(rectangle).tif');
 figure,imshow(f);
 F = fft2(f);
 S = abs(F);
 figure,imshow(S, []);
 
 Fc = fftshift(F);
 figure, imshow(abs(Fc), []);
 
 S2 = log(1 + abs(Fc));
 figure, imshow(S2, []);