f = imread('Fig0203(a).tif');
%subplot(2,1,1);
figure, imhist(f);
%g = im2uint8(mat2gray(log(1 + double(f))));
%subplot(1,2,2);
%imshow(g);

h = imhist(f, 25);
horz = linspace(0, 255, 25);
%subplot(2,1,2);

figure, bar(horz, h);
axis([0 255 0 60000]);
set(gca, 'xtick', 0:50:255);
set(gca, 'ytick', 0:20000:60000);

figure, stem(horz, h, 'fill');
axis([0 255 0 60000]);
set(gca, 'xtick', 0:50:255);
set(gca, 'ytick', 0:20000:60000);

hc = imhist(f);
figure, plot(hc);
axis([0 255 0 60000]);
set(gca, 'xtick', 0:50:255);
set(gca, 'ytick', 0:20000:60000);
