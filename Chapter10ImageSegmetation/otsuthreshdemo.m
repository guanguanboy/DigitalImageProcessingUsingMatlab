%使用otsu's方法进行阈值分割
f = imread('Fig1013(a).tif');

[T, SM] = graythresh(f);
disp(T);
disp(SM);

disp(T*255); %从结果看该值为125，这个阈值与基本全局处理算法得到的阈值几乎相同

%如下图像分割任务的目标：从背景中分割出细胞的边界(图像中最亮的区域)
f2 = imread('Fig1014(a).tif');
imshow(f2);
figure, imhist(f2);

%使用基本全局算法进行分割
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
figure, imshow(g); %从结果可以看到使用基本全局算法进行分割，无法分割成功

%使用otsu’s方法分割
[T, SM] = graythresh(f2);
disp(T);
disp(SM);
disp(T*255);
gotsu = im2bw(f2, T);
figure, imshow(gotsu); %从结果可以看出，使用otsu's方法分割是有效的