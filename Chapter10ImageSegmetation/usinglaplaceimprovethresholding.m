%本例演示如何使用lapalace边缘信息改进全局阈值处理
f = imread('Fig1017(a).tif');
imshow(f);%如图是一副酵母细胞的8bit图像，我们期望使用全局阈值处理得到亮点对应的区域
f = tofloat(f);
figure, imhist(f); %显示直方图
hf = imhist(f);
[Tf, SMf] = graythresh(f);
disp(Tf); %显示阈值
disp(SMf);%显示可分性
gf = im2bw(f, Tf); %直接使用otsu方法对图像进行分割
figure, imshow(gf);%从结果可以看出，直接分割没有达到把亮点分离出来的效果

%下面使用lapalace绝对值边缘信息辅助分割，因为lapalace阈值比梯度产生的阈值更稀疏，这里使用比较小的百分比
w = [-1  -1  -1
     -1  8   -1
     -1  -1  -1];
 
lap = abs(imfilter(f, w, 'replicate'));

lap = lap/max(lap(:));
figure, imhist(lap);
title('lapalace hist');

h = imhist(lap);
Q = percentile2i(h, 0.995); %使用99%的高百分比估计梯度的阈值，因为我们只想保留梯度图像中的较大值
%因为只有较大值发生在物体与背景的边界处;Q的值在【0，1】范围内

markerImage = lap > Q; %用Q对梯度图像做阈值处理，形成标记图像，
figure, imshow(markerImage);

fp = f.*markerImage; %从f中提取梯度值比Q大的点，
figure, imshow(fp); %图像fp中包含围绕背景和物体边界的像素，所以fp的直方图受0的控制
%因为我们的兴趣在于物体边界周围的分隔值，所以需要消除0对直方图的贡献。因此需要把hp的第一个元素排除在外
%然后用结果直方图得到otsu阈值。
title('f.*markerImage');
hp = imhist(fp); %得到结果的直方图

hp(1)= 0; %把hp的第一个元素排除在外
figure, bar(hp);
T = otsuthresh(hp);
threshold = T*(numel(hp) - 1);
disp(threshold); %阈值为115，可分性更好
g = im2bw(f, T);
figure, imshow(g);


