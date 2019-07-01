f = imread('Fig0508.tif');
imshow(f);
axis on;
xlabel x;
ylabel y;
iptsetpref imshowAxesVisible on;

figure, imshow(f, 'XData', [-20 20], 'YData', [-10 10]);
axis on;
xlabel x;
ylabel y;
axis([8 8.5 0.8 1.1]);
