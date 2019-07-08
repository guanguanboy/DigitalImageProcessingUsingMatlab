%ʹ��otsu's����������ֵ�ָ�
f = imread('Fig1013(a).tif');

[T, SM] = graythresh(f);
disp(T);
disp(SM);

disp(T*255); %�ӽ������ֵΪ125�������ֵ�����ȫ�ִ����㷨�õ�����ֵ������ͬ

%����ͼ��ָ������Ŀ�꣺�ӱ����зָ��ϸ���ı߽�(ͼ��������������)
f2 = imread('Fig1014(a).tif');
imshow(f2);
figure, imhist(f2);

%ʹ�û���ȫ���㷨���зָ�
count = 0;
T = mean2(f2);
done = false;

while ~done
	count = count + 1;
	g = f2 > T;
	Tnext = 0.5 * (mean(f2(g)) + mean(f2(~g)));
	done = abs(T - Tnext) < 0.5;
	T = Tnext;
	
end

disp(count);
disp(T);
g = im2bw(f2, T/255);
figure, imshow(g); %�ӽ�����Կ���ʹ�û���ȫ���㷨���зָ�޷��ָ�ɹ�

%ʹ��otsu��s�����ָ�
[T, SM] = graythresh(f2);
disp(T);
disp(SM);
disp(T*255);
gotsu = im2bw(f2, T);
figure, imshow(gotsu); %�ӽ�����Կ�����ʹ��otsu's�����ָ�����Ч��