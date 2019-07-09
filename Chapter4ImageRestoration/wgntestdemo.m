%https://www.cnblogs.com/YoungHit/archive/2012/03/09/2388230.html

noise = wgn(1000, 1, 0); %生成1000*1个高斯白噪声，功率为0dbW
mean_value = mean(noise); %求均值
disp(mean_value);
variance = var(noise); %求方差
disp(variance);
figure,hist(noise, 20); %求噪声幅值的直方图
xlabel('幅值');
ylabel('频次');
title('噪声幅值的直方图'); %解释了幅度分布服从高斯分布，


%功率谱的显示
y1 = fft(noise, 1000); %采样点个数1000个
%p1 = y1.*conj(y1); %功率，幅度值为abs(y1)
p1 = abs(y1);
ff = 0:499;
stem(ff, p1(1:500)); %只显示一半值
xlabel('频率');
ylabel('功率');
title('功率谱'); %解释了功率谱密度服从均匀分布
