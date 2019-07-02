f = imread('Fig0322(a).tif');
imshow(f);

[M N] = size(f);
[f, revertclass] = tofloat(f);
F = fft2(f);
S = gscale(log(1 + abs(fftshift(F))));
figure, imshow(S);

H = recnotch('reject', 'vertical', M, N, 3, 15, 15);
figure, imshow(fftshift(H));

g = dftfilt(f, H);
g = revertclass(g);
figure, imshow(g);

Hrecpass = recnotch('pass', 'vertical', M, N, 3, 15, 15);
interference = dftfilt(f, Hrecpass);

figure, imshow(fftshift(Hrecpass));
interference = gscale(interference);
figure, imshow(interference);
