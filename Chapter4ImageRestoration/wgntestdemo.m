%https://www.cnblogs.com/YoungHit/archive/2012/03/09/2388230.html

noise = wgn(1000, 1, 0); %����1000*1����˹������������Ϊ0dbW
mean_value = mean(noise); %���ֵ
disp(mean_value);
variance = var(noise); %�󷽲�
disp(variance);
figure,hist(noise, 20); %��������ֵ��ֱ��ͼ
xlabel('��ֵ');
ylabel('Ƶ��');
title('������ֵ��ֱ��ͼ'); %�����˷��ȷֲ����Ӹ�˹�ֲ���


%�����׵���ʾ
y1 = fft(noise, 1000); %���������1000��
%p1 = y1.*conj(y1); %���ʣ�����ֵΪabs(y1)
p1 = abs(y1);
ff = 0:499;
stem(ff, p1(1:500)); %ֻ��ʾһ��ֵ
xlabel('Ƶ��');
ylabel('����');
title('������'); %�����˹������ܶȷ��Ӿ��ȷֲ�
