f = imread('Fig0309(a).tif');
imshow(f);

f = tofloat(f);
F = fft2(f);
S = fftshift(log(1 + abs(F)));
figure,imshow(S, []);

h = fspecial('sobel');
figure,freqz2(h);

PQ = paddedsize(size(f));
H = freqz2(h, PQ(1), PQ(2));
H1 = ifftshift(H);
%figure,imshow(H1, []);

figure,imshow(abs(H), [ ]);
figure,imshow(abs(H1), []);

%�����˲����ͼ��
gs = imfilter(f, h); %�����˲�
figure,imshow(gs, []);
gf = dftfilt(f, H1); %Ƶ���˲�
figure,imshow(gf, []);

figure, imshow(abs(gs), []);
figure, imshow(abs(gf), []);


%��ֵ����
figure, imshow(abs(gs) > 0.2 * abs(max(gs(:))));
figure, imshow(abs(gf) > 0.2 * abs(max(gf(:))));

