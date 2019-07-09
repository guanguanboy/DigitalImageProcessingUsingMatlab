%本例演示如何使用局部阈值处理进行出现分割
f = imread('Fig1017(a).tif');
imshow(f);%如图是一副酵母细胞的8bit图像，我们期望分割出细胞并从细胞中分割出细胞核

%使用otsu's方法处理
[TGlobal] = graythresh(f);
gGlobal = imbinarize(f, TGlobal);
figure, imshow(gGlobal); %从结果可以看出，这种方法可以从背景中分割出细胞，但是
%不能将细胞核分割出来。因为细胞核比细胞本身明显更亮，所以预期围绕细胞核边界的
%标准差相对较大，而围绕细胞边界的标准差稍微小一些，如下图所示
SIG = stdfilt(f, ones(3));
figure, imshow(SIG, []); %由此得出如下结论：使用基于局部标准差的函数localthresh，来进行分割应该很有帮助

g = localthresh(f, ones(3), 30, 1.5, 'global');
figure, imshow(g);%从图中可以看出，运用了属性的分割是相当有效的。个别细胞已经从背景中分割出来了，并且
%细胞核也被完全分离出来了。

