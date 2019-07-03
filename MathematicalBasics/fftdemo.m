%matlab fft demo
%t = 0:.001:.25;
%x = sin(2*pi*50*t) + sin(2*pi*120*t);%

% t = 1:pi/100:120;
% x = sin(2*pi*50*t);
% 
% plot(t,x);
% xlabel t;
% ylable x;

%绘制2x的曲线
x = 0:pi/100:2*pi;
y = sin(2*x);
plot(x,y);

x1 = 0:0.0001:1;
y1 = sin(2*pi*50*x1); %频率为50的正玄函数的演示
figure, plot(x1, y1);

%https://ww2.mathworks.cn/help/matlab/examples/fft-for-spectral-analysis.html?lang=en
Y1 = fft(y1);
figure, plot(abs(Y1));


