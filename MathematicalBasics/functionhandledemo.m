%演示函数句柄的用法

%创建函数句柄
% function y = computeSquare(x)
% y = x.^2;
% end

%创建句柄并调用该函数以计算 4 的平方。
f = @computeSquare;
a = 4;
b = f(a);
disp(b);

%函数句柄是您可传递给其他函数的变量。例如，计算 x2 在区间 [0,3] 上的积分
q = integral(f,0,3);
disp(q);

%通过匿名函数来计算上面的积分
sqr = @(n) n.^2;
x = sqr(3);
disp(x);

p = integral(sqr,0,3);
disp(p);

%函数句柄组成元胞数组
C = {@sin, @cos, @tan};
C{2}(pi)

%函数句柄组成结构体数组
S.a = @sin;  S.b = @cos;  S.c = @tan;
S.a(pi/2)