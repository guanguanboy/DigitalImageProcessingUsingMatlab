%�ο�matlab���ӣ�https://ww2.mathworks.cn/help/matlab/ref/fft.html?s_tid=doc_ta
Fs = 1000;                    % Sampling frequency ����Ƶ��
T = 1/Fs;                     % Sampling period ��������
L = 1000;                     % Length of signal
t = (0:L-1)*T;                % Time vector

x1 = cos(2*pi*50*t);          % First row wave ,Ƶ��50Hz
x2 = cos(2*pi*150*t);         % Second row waveƵ��150Hz
x3 = cos(2*pi*300*t);         % Third row waveƵ��300Hz

x = x3;

plot(t(1:100),x(1:100)) %����ǰ100������
title(['Row ',num2str(1),' in the Time Domain'])


% n = 2^nextpow2(L);
% 
% dim = 2;
% 
% %�����źŵĸ���Ҷ�任��
% Y = fft(X,n,dim);
Y = fft(x); %�������֮��Y1�д洢����Ϊ����


% %����ÿ���źŵ�˫��Ƶ�׺͵���Ƶ�ס�
P2 = abs(Y/L); %����abs������Ǹ����ķ�ֵ
P1 = P2(1:L/2);
% P1 = P2(:,1:n/2+1);
% P1(:,2:end-1) = 2*P1(:,2:end-1);
% 
% %��Ƶ���ڣ�Ϊ����ͼ���е�ÿһ�л��Ƶ����ֵƵ�ס�
figure, plot(P1) %Fs = 1000, n = 2^nextpow2(L)
title(['Row ',num2str(1),' in the Frequency Domain'])
