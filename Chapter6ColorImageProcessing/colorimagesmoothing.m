%彩色图像平滑处理
fc = imread('Fig0622(a).tif');
imshow(fc);
w = fspecial('average',25);

fr = fc(:,:,1);
fg = fc(:,:,2);
fb = fc(:,:,3);

figure, imshow(fr);
title('fr');

figure, imshow(fg);
title('fg');

figure, imshow(fb);
title('fb');

fr_filtered = imfilter(fr, w, 'replicate');
fg_filtered = imfilter(fg, w, 'replicate');
fb_filtered = imfilter(fb, w, 'replicate');

fc_filtered = cat(3, fr_filtered, fg_filtered, fb_filtered);
figure,imshow(fc_filtered);
title('fc_filtered');

fc_filtered1 = imfilter(fc, w, 'replicate');
figure, imshow(fc_filtered1);
title('fc_filtered1');

%对HSI种的亮度分量进行平滑
h = rgb2hsi(fc);
H = h(:,:,1);
S = h(:,:,2);
I = h(:,:,3);

figure, imshow(H);
title('H');

figure, imshow(S);
title('S');

figure, imshow(I);
title('I');

I_filtered = imfilter(I, w, 'replicate');
S_filtered = imfilter(S, w, 'replicate');
H_filtered = imfilter(H, w, 'replicate');

h = cat(3, H, S, I_filtered);
I_smoothing_f = hsi2rgb(h);
figure, imshow(I_smoothing_f);
title('I_smoothing_f');

h1 = cat(3, H_filtered, S_filtered, I_filtered);
HSI_smoothing_f = hsi2rgb(h1);
figure, imshow(HSI_smoothing_f);
title('HSI_smoothing_f');

