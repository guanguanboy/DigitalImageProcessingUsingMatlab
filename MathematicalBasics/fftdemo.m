%matlab fft demo
%t = 0:.001:.25;
%x = sin(2*pi*50*t) + sin(2*pi*120*t);%

% t = 1:pi/100:120;
% x = sin(2*pi*50*t);
% 
% plot(t,x);
% xlabel t;
% ylable x;

%����2x������
x = 0:pi/100:2*pi;
y = sin(2*x);
plot(x,y);

x1 = 0:0.0001:1;
y1 = sin(2*pi*50*x1); %Ƶ��Ϊ50��������������ʾ
figure, plot(x1, y1);

%https://ww2.mathworks.cn/help/matlab/examples/fft-for-spectral-analysis.html?lang=en
Y1 = fft(y1);
figure, plot(abs(Y1));


