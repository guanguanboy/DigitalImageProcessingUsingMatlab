z = 4 + 3i;
r = abs(z); %复数z的模，复平面的原点到点（4，3）的向量的长度

theta = atan2(imag(z), real(z)); %theta是该向量与实轴的夹角

theta1 = angle(z); %也可以通过angle来计算这个夹角

%将 r 和 theta 转换回原始复数。
z1 = r*exp(i*theta);

%绘制四象限反正切图
% 绘制 atan2(Y,X)（对于 -4<Y<4 和 -4<X<4）。
% 
% 定义要在其上绘制的区间。
[X,Y] = meshgrid(-4:0.1:4,-4:0.1:4);

%计算 atan2(Y,X) 在此区间上的值。
P = atan2(Y,X);

%使用 surf 生成函数的曲面图。请注意，plot 绘制存在于 Y=0 的不连续性（对于所有 X<0）。
surf(X,Y,P);
view(45,45);