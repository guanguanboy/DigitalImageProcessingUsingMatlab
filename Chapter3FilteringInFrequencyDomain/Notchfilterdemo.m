%����ʾ����ʾ���ݲ������˲�����Ӧ��
f = imread('Fig0321(a).tif');
imshow(f);

[M N] = size(f);

[f, revertclass] = tofloat(f);

F = fft2(f);
S = gscale(log(1 + abs(fftshift(F))));
figure, imshow(S);

C1 = [99 154; 128 163]; %����ָ�������㣬��ʵ���ĸ��㣬��ֹ���ĸ��㴦���뾶Ϊ5��СԲȦ��Ƶ�ʵ�ͨ����

%notch filter;
H1 = cnotch('gaussian', 'reject', M, N, C1, 5);

%compute spectrum of the filtered transform and show it as an image
P1 = gscale(fftshift(H1).*(tofloat(S)));
figure, imshow(P1);

%Filter image
g1 = dftfilt(f, H1);
g1 = revertclass(g1);
figure, imshow(g1);

C2 = [99 154; 128 163;49 160;133 233;55 132; 108 225;112 74]; %��ֹ���µ㴦������ԳƵ㴦Ƶ�ʵ�ͨ��
H2 = cnotch('gaussian', 'reject', M, N, C2, 5);

%compute spectrum of the filtered transform and show it as an image
P2 = gscale(fftshift(H2).*(tofloat(S)));
figure, imshow(P2);

%Filter image
g2 = dftfilt(f, H2);
g2 = revertclass(g2);
figure, imshow(g2);
