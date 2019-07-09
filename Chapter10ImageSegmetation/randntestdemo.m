r = randn(50, 50);
disp(r);
%plot(r);
hist(r); %从直方图可以看出，数据服从正态分布

r1 = rand(50);

figure, hist(r1); %从图中可以看出，数据服从均匀分布

y=rand(1,3000)
ymin=min(y);
ymax=max(y);
x=linspace(ymin,ymax,20);%将最大最小区间分成20个等分点(19等分),然后分别计算各个区间的个数
yy=hist(y,x);%计算各个区间的个数
yy=yy/length(y);%计算各个区间的个数
figure, bar(x,yy)%画出概率密度分布图
