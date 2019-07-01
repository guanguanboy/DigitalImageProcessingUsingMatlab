f = imread('Fig0305(a).tif');
imshow(f);
[M, N] = size(f);
[f, revertclass] = tofloat(f);
F = fft2(f);
sig = 10;
H = lpfilter('gaussian', M, N, sig);
G = H.*F;
g = ifft2(G);
g = revertclass(g);
figure,imshow(g);

PQ = paddedsize(size(f));
Fp = fft2(f, PQ(1), PQ(2));
Hp = lpfilter('gaussian', PQ(1), PQ(2), 2*sig);
Gp = Hp.*Fp; % “.*”表示数组相乘
gp = ifft2(Gp);
gpc = gp(1:size(f,1), 1:size(f,2));
gpc = revertclass(gpc);
figure, imshow(gp);

%对应的空间滤波实现形式
h = fspecial('gaussian', 15, 7);
gs = imfilter(f, h);
figure, imshow(gs);