%�˻��������˻�ͼ��Ľ�ģ������ģ��ͼ��
f = checkerboard(8);

%imshow(f);
imshow(pixeldup(f, 8), []);

PSF = fspecial('motion', 7, 45); %psf����ɢ���������˻������ڿռ���Ľз�
gb = imfilter(f, PSF, 'circular'); %gb ��len=7��theta = -45���˻�����ģ������ͼ��

%figure, imshow(gb);
figure,imshow(pixeldup(gb, 8), []);

%��������ͼ��,��˹��������ֵ��0��������0.001
noise = imnoise2('Gaussian', size(f, 1), size(f, 2), 0,sqrt(0.001));

%figure, imshow(noise);
figure,imshow(pixeldup(noise, 8), []); %��ÿ�������ڴ�ֱ��ˮƽ������8����ʾ
%����ģ����������ͼ��
g = gb + noise;
%figure,imshow(g);
figure,imshow(pixeldup(g, 8), []);

%������ʾʹ��deconvwnr������ԭͼ��deconvwnr�����Ĺ�����Deblur image using Wiener filter
%���Բο�https://ww2.mathworks.cn/help/images/ref/deconvwnr.html?s_tid=doc_ta
%ֱ�����˲���ԭ
frest1 = deconvwnr(g, PSF); %�����Ϊ0ʱ��ά���˲����˻�Ϊֱ�����˲�
figure,imshow(pixeldup(frest1, 8), []); %�ӽ�����Կ���������������������Ӱ�������

%������ȵ�ά���˲�
Sn = abs(fft2(noise)).^2; %noise power spectrum
nA = sum(Sn(:)) / numel(noise); %noise average power

Sf = abs(fft2(f)).^2; %image power spectrum
fA = sum(Sf(:))/ numel(f); %image average power

R = nA/fA;

frest2 = deconvwnr(g, PSF, R);
figure,imshow(pixeldup(frest2, 8), []); 

%�����ϵ����ά���˲�
NCORR = fftshift(real(ifft2(Sn)));
ICORR = fftshift(real(ifft2(Sf)));
frest3 = deconvwnr(g, PSF, NCORR, ICORR);
figure,imshow(pixeldup(frest3, 8), []); 

%Լ������С���˷�(����)�˲�
%ʹ�ù����亯��deconvreg
frest4 = deconvreg(g, PSF, 4); %4 ��noisepower�ĳ�ʼ���ƣ�֮ǰ����������Ϊ0.001����ֵΪ0.����Ϊ64*64*(0.001+0) Լ����4
figure,imshow(pixeldup(frest4, 8), []); %��ͼ����g�Ƚϣ���΢��Щ���ƣ���Ҳ���Կ�����Ч����̫��

frest5 = deconvreg(g, PSF, 0.4, [1e-7 1e7]);
figure,imshow(pixeldup(frest5, 8), []); %�ӽ���������Ч����û��ʹ�������ϵ����ά���˲���Ч���ã��������������ϵ����ά���˲�ʹ����������ͼ��Ĺ����׵�ȫ��֪ʶ


