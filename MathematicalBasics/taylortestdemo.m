%演示在matlab中进行泰勒展开
%taylor公式默认在x=0点展开，也就是麦克劳林展开，默认在x的6次方处截至展开
syms x;
T1 = taylor(exp(x));
T2 = taylor(sin(x));
T3 = taylor(cos(x));
y = 1/(1 - x);
T4 = taylor(y, x);


%sympref('PolynomialDisplayStyle','ascend');
%sympref('PolynomialDisplayStyle','ascend');
disp(T1);
disp(T2);
disp(T3);
disp(T4);

%在x==2这一点的taylor展开式
T5 = taylor(y, x, 'ExpansionPoint', 2);
disp(T5);

%Find the Maclaurin series expansion for f = sin(x)/x.
f = sin(x)/x;
T6 = taylor(f, x);
disp(T6);

%Use Order to control the truncation order, 控制展开式中多项式的最高次幂
T8 = taylor(f, x, 'Order', 8);
T10 = taylor(f, x, 'Order', 10);

disp(T8);
disp(T10);

fplot([T6 T8 T10 f]); %fplot(f) 在默认区间 [-5 5]（对于 x）绘制由函数 y = f(x) 定义的曲线。
xlim([-4 4]);%xlim(limits) 设置当前坐标区或图的 x 坐标轴范围。将 limits 指定为 [xmin xmax] 形式的二元素向量，其中 xmax 大于 xmin。
grid on

legend('approximation of sin(x)/x up to O(x^6)',...
       'approximation of sin(x)/x up to O(x^8)',...
       'approximation of sin(x)/x up to O(x^{10})',...
       'sin(x)/x','Location','Best')
title('Taylor Series Expansion');

