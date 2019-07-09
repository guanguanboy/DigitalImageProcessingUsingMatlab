%https://ww2.mathworks.cn/help/matlab/ref/filter.html?s_tid=doc_ta#buagwwg-2
%�ƶ�ƽ���˲�����ʾ
%����һ������������������ɵ� 1��100 �����������е��������߱�����������𻵡�
t = linspace(-pi,pi,100);
rng default  %initialize random number generator
x = sin(t) + 0.25*rand(size(t));

%���ڴ�СΪ 5 ʱ�����������ݺ����ķ��Ӻͷ�ĸϵ����
windowSize = 5; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;

%�����ݵ��ƶ�ƽ��ֵ�����������ԭʼ���ݵ�ͼ��
y = filter(b,a,x);

plot(t,x)
hold on
plot(t,y)
legend('Input Data','Filtered Data')