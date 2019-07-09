%https://ww2.mathworks.cn/help/matlab/ref/filter.html?s_tid=doc_ta#buagwwg-2
%移动平均滤波器演示
%创建一个由正弦曲线数据组成的 1×100 行向量，其中的正弦曲线被随机干扰所损坏。
t = linspace(-pi,pi,100);
rng default  %initialize random number generator
x = sin(t) + 0.25*rand(size(t));

%窗口大小为 5 时，计算有理传递函数的分子和分母系数。
windowSize = 5; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;

%求数据的移动平均值，并绘制其对原始数据的图。
y = filter(b,a,x);

plot(t,x)
hold on
plot(t,y)
legend('Input Data','Filtered Data')