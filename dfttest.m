 f = imread('Fig0424(a)(rectangle).tif');
 figure,imshow(f);
 F = fft2(f); %�ú������صĸ���Ҷ�任������ԭ�������Ͻǣ�4��4��֮һ���ڽ�����Ƶ�ʾ��ε�����
 S = abs(F); %����Ҷ�׵ļ��㣨����������ÿ��Ԫ�صķ��ȣ�ʵ�����鲿ƽ���͵�ƽ������
 figure,imshow(S, []);
 
 Fc = fftshift(F);%���任��ԭ�㣨��Ƶ�ɷ֣��ƶ���Ƶ�ʾ��ε�����
 figure, imshow(abs(Fc), []);
 
 S2 = log(1 + abs(Fc)); %ͨ�������任��ǿϸ��
 figure, imshow(S2, []);
 
 %��ǵļ���
 phi = angle(F);
 figure, imshow(phi, []);
 