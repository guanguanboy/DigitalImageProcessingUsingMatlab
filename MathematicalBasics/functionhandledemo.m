%��ʾ����������÷�

%�����������
% function y = computeSquare(x)
% y = x.^2;
% end

%������������øú����Լ��� 4 ��ƽ����
f = @computeSquare;
a = 4;
b = f(a);
disp(b);

%������������ɴ��ݸ����������ı��������磬���� x2 ������ [0,3] �ϵĻ���
q = integral(f,0,3);
disp(q);

%ͨ��������������������Ļ���
sqr = @(n) n.^2;
x = sqr(3);
disp(x);

p = integral(sqr,0,3);
disp(p);

%����������Ԫ������
C = {@sin, @cos, @tan};
C{2}(pi)

%���������ɽṹ������
S.a = @sin;  S.b = @cos;  S.c = @tan;
S.a(pi/2)