%参考matlab连接：https://ww2.mathworks.cn/help/matlab/ref/fft.html?s_tid=doc_ta
Fs = 1000;                    % Sampling frequency 采样频率
T = 1/Fs;                     % Sampling period 采样周期
L = 1000;                     % Length of signal
t = (0:L-1)*T;                % Time vector

x1 = cos(2*pi*50*t);          % First row wave ,频率50Hz
x2 = cos(2*pi*150*t);         % Second row wave频率150Hz
x3 = cos(2*pi*300*t);         % Third row wave频率300Hz

x = x3;

plot(t(1:100),x(1:100)) %绘制前100个数据
title(['Row ',num2str(1),' in the Time Domain'])


% n = 2^nextpow2(L);
% 
% dim = 2;
% 
% %计算信号的傅里叶变换。
% Y = fft(X,n,dim);
Y = fft(x); %计算结束之后，Y1中存储的数为复数


% %计算每个信号的双侧频谱和单侧频谱。
P2 = abs(Y/L); %这里abs计算的是复数的幅值
P1 = P2(1:L/2);
% P1 = P2(:,1:n/2+1);
% P1(:,2:end-1) = 2*P1(:,2:end-1);
% 
% %在频域内，为单个图窗中的每一行绘制单侧幅值频谱。
figure, plot(P1) %Fs = 1000, n = 2^nextpow2(L)
title(['Row ',num2str(1),' in the Frequency Domain'])
