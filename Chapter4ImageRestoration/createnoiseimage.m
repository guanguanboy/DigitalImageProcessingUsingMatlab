%退化函数及退化图像的建模，生成模糊图像
f = checkerboard(8);

%imshow(f);
imshow(pixeldup(f, 8), []);

PSF = fspecial('motion', 7, 45); %psf点扩散函数，是退化函数在空间域的叫法
gb = imfilter(f, PSF, 'circular'); %gb 是len=7，theta = -45的退化函数模糊过的图像

%figure, imshow(gb);
figure,imshow(pixeldup(gb, 8), []);

%产生噪声图像,高斯噪声，均值是0，方差是0.001
noise = imnoise2('Gaussian', size(f, 1), size(f, 2), 0,sqrt(0.001));

%figure, imshow(noise);
figure,imshow(pixeldup(noise, 8), []); %将每个像素在垂直及水平方向复制8份显示
%产生模糊带噪声的图像
g = gb + noise;
%figure,imshow(g);
figure,imshow(pixeldup(g, 8), []);

%下面演示使用deconvwnr函数复原图像，deconvwnr函数的功能是Deblur image using Wiener filter
%可以参考https://ww2.mathworks.cn/help/images/ref/deconvwnr.html?s_tid=doc_ta
%直接逆滤波复原
frest1 = deconvwnr(g, PSF); %信噪比为0时，维纳滤波器退化为直接逆滤波
figure,imshow(pixeldup(frest1, 8), []); %从结果可以看到，这个结果是由噪声的影响决定的

%带信噪比的维纳滤波
Sn = abs(fft2(noise)).^2; %noise power spectrum
nA = sum(Sn(:)) / numel(noise); %noise average power

Sf = abs(fft2(f)).^2; %image power spectrum
fA = sum(Sf(:))/ numel(f); %image average power

R = nA/fA;

frest2 = deconvwnr(g, PSF, R);
figure,imshow(pixeldup(frest2, 8), []); 

%自相关系数的维纳滤波
NCORR = fftshift(real(ifft2(Sn)));
ICORR = fftshift(real(ifft2(Sf)));
frest3 = deconvwnr(g, PSF, NCORR, ICORR);
figure,imshow(pixeldup(frest3, 8), []); 

%约束的最小二乘法(规则化)滤波
%使用工具箱函数deconvreg
frest4 = deconvreg(g, PSF, 4); %4 是noisepower的初始估计，之前的噪声方差为0.001，均值为0.估计为64*64*(0.001+0) 约等于4
figure,imshow(pixeldup(frest4, 8), []); %该图像与g比较，稍微有些改善，但也可以看出，效果不太好

frest5 = deconvreg(g, PSF, 0.4, [1e-7 1e7]);
figure,imshow(pixeldup(frest5, 8), []); %从结果看，这个效果，没有使用自相关系数的维纳滤波的效果好，这是由于自相关系数的维纳滤波使用了噪声和图像的功率谱的全部知识


