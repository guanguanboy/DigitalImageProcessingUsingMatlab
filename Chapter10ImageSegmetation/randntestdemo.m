r = randn(50, 50);
disp(r);
%plot(r);
hist(r); %��ֱ��ͼ���Կ��������ݷ�����̬�ֲ�

r1 = rand(50);

figure, hist(r1); %��ͼ�п��Կ��������ݷ��Ӿ��ȷֲ�

y=rand(1,3000)
ymin=min(y);
ymax=max(y);
x=linspace(ymin,ymax,20);%�������С����ֳ�20���ȷֵ�(19�ȷ�),Ȼ��ֱ�����������ĸ���
yy=hist(y,x);%�����������ĸ���
yy=yy/length(y);%�����������ĸ���
figure, bar(x,yy)%���������ܶȷֲ�ͼ
