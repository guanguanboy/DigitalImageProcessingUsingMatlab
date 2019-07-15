%��ʾ��matlab�н���̩��չ��
%taylor��ʽĬ����x=0��չ����Ҳ�����������չ����Ĭ����x��6�η�������չ��
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

%��x==2��һ���taylorչ��ʽ
T5 = taylor(y, x, 'ExpansionPoint', 2);
disp(T5);

%Find the Maclaurin series expansion for f = sin(x)/x.
f = sin(x)/x;
T6 = taylor(f, x);
disp(T6);

%Use Order to control the truncation order, ����չ��ʽ�ж���ʽ����ߴ���
T8 = taylor(f, x, 'Order', 8);
T10 = taylor(f, x, 'Order', 10);

disp(T8);
disp(T10);

fplot([T6 T8 T10 f]); %fplot(f) ��Ĭ������ [-5 5]������ x�������ɺ��� y = f(x) ��������ߡ�
xlim([-4 4]);%xlim(limits) ���õ�ǰ��������ͼ�� x �����᷶Χ���� limits ָ��Ϊ [xmin xmax] ��ʽ�Ķ�Ԫ������������ xmax ���� xmin��
grid on

legend('approximation of sin(x)/x up to O(x^6)',...
       'approximation of sin(x)/x up to O(x^8)',...
       'approximation of sin(x)/x up to O(x^{10})',...
       'sin(x)/x','Location','Best')
title('Taylor Series Expansion');

