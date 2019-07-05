%骨骼化：骨骼化图像,另一种减少二值图像中的物体为一组细“笔画”的方法，这些细骨骼仍保留原始物体形状的重要信息。
f = imread('Fig0916(a).tif');
imshow(f);
fs = bwmorph(f, 'skel', Inf); %重复操作直到稳定
figure, imshow(fs);

fspur = bwmorph(fs, 'spur', 5); %去掉毛刺像素
figure, imshow(fspur);

%骨骼化，细化的过程经常产生短的无关的毛刺，去掉毛刺的过程称为裁剪，也可以使用
%函数endpoints来达到这个目的按，方法是反复确认并去除端点。

for k = 1:5
    fs = fs & ~endpoints(fs); %通过5次去除端点的迭代，得以后处理骨骼化图像fs。
end

figure, imshow(fs);