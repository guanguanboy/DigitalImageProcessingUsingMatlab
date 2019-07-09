%使用基于梯度的边缘信息改进阈值处理
f = imread('Fig1016(a).tif');
f = tofloat(f);
imshow(f);
figure, imhist(f); %直方图是单峰的，在这种情况下，预期全局阈值处理将会失败
%当物体比背景小得多时，他们对直方图得贡献可以忽略不计。使用边缘信息可以改进这种情况

%计算梯度图像
sx = fspecial('sobel');
sy = sx';
gx = imfilter(f, sx, 'replicate');
gy = imfilter(f, sy, 'replicate');

grad = sqrt(gx.*gx + gy.*gy);
grad = grad/max(grad(:)); %把grad的值归一化到正确的{0， 1}范围内
figure, imshow(grad);

h = imhist(grad); %得到grad的直方图
Q = percentile2i(h, 0.999); %使用99%的高百分比估计梯度的阈值，因为我们只想保留梯度图像中的较大值
%因为只有较大值发生在物体与背景的边界处;Q的值在【0，1】范围内

markerImage = grad > Q; %用Q对梯度图像做阈值处理，形成标记图像，
figure, imshow(markerImage);

fp = f.*markerImage; %从f中提取梯度值比Q大的点，
figure, imshow(fp); %图像fp中包含围绕背景和物体边界的像素，所以fp的直方图受0的控制
%因为我们的兴趣在于物体边界周围的分隔值，所以需要消除0对直方图的贡献。因此需要把hp的第一个元素排除在外
%然后用结果直方图得到otsu阈值。
hp = imhist(fp); %得到结果的直方图

hp(1)= 0; %把hp的第一个元素排除在外
figure, bar(hp);
T = otsuthresh(hp);
T*(numel(hp) - 1)

g = im2bw(f, T);
figure, imshow(g);
