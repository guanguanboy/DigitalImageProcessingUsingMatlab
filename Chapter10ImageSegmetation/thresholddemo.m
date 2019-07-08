%���ڵ�����������ֵͼ��ָ�
f = imread('Fig1013(a).tif');
imshow(f);

count = 0;
T = mean2(f);
done = false;

while ~done
	count = count + 1;
	g = f > T;
	Tnext = 0.5 * (mean(f(g)) + mean(f(~g)));
	done = abs(T - Tnext) < 0.5;
	T = Tnext;
	
end

disp(count);
disp(T);
g = im2bw(f, T/255); %�ڶ��������ķ�Χ��Luminance threshold, specified as a number in the range [0, 1]. 
figure, imhist(f);
figure, imshow(g);
