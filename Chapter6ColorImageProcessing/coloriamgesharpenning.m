%彩色图像锐化处理demo
fb = imread('Fig0625(a).tif');
imshow(fb);
lapmask = [1 1 1; 1 -8 1; 1 1 1];

fb = tofloat(fb);
fen = fb - imfilter(fb, lapmask, 'replicate');
figure, imshow(fen); %与原图比较，该图在锐度特性上显著加强，比如水滴、叶子上的纹路，
%花朵黄色中心和前景中明显的绿色植物
