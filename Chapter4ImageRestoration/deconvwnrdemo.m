%deconvwnr demo
%来自matlab的示例：
%https://ww2.mathworks.cn/help/images/ref/deconvwnr.html?s_tid=doc_ta

I = im2double(imread('cameraman.tif'));
imshow(I);
title('Original Image (courtesy of MIT)');

%Simulate a motion blur.
LEN = 21;
THETA = 11;
PSF = fspecial('motion', LEN, THETA);
blurred = imfilter(I, PSF, 'conv', 'circular');
figure, imshow(blurred)

%Simulate additive noise.
noise_mean = 0;
noise_var = 0.0001;
blurred_noisy = imnoise(blurred, 'gaussian', ...
                        noise_mean, noise_var);
figure, imshow(blurred_noisy)
title('Simulate Blur and Noise')

%Try restoration assuming no noise.逆滤波
estimated_nsr = 0;
wnr2 = deconvwnr(blurred_noisy, PSF, estimated_nsr);
figure, imshow(wnr2)
title('Restoration of Blurred, Noisy Image Using NSR = 0')

%Try restoration using a better estimate of the noise-to-signal-power ratio.
estimated_nsr = noise_var / var(I(:));
wnr3 = deconvwnr(blurred_noisy, PSF, estimated_nsr);
figure, imshow(wnr3)
title('Restoration of Blurred, Noisy Image Using Estimated NSR');

