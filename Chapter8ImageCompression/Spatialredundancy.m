%演示空间冗余

f1 = imread('Fig0807(a).tif');
%imshow(f1);
c1 = mat2huff(f1);
imhist(f1);
f1trop = ntrop(f1);
disp(f1trop);

ratio1 = imratio(f1, c1);
disp(ratio1);

f2 = imread('Fig0807(c).tif');
c2 = mat2huff(f2);
figure, imhist(f2);

f2trop = ntrop(f2);
disp(f2trop);

ratio2 = imratio(f2, c2);
disp(ratio2);

%从结果可以看出，这两幅图像的一阶熵大致相同，使用霍夫曼编码的变长压缩，压缩比也大致相同
%分别是1.07与1.08，这说明了如下结果，变长编码压缩没有利用下面第二张图中排成一列的
%火柴之间的明显结构关系的优点。显然在第二幅图像中，像素与像素之间的相关性更强。
%但这一现象在第一幅图中也存在。因为任何一个像素值都可以合理地从他们得相邻像素值预测。
%这些单独像素携带得信息相对较少。单一像素得视觉贡献对一副图像来说大部分是多余得。
%他们应该能够在相邻像素值的基础上推测出来。这些相关性是像素间冗余的潜在基础。

% 为了减少像素间的冗余，通常必须把由人观察和解释的二维像素数组格式，变换为更有效的格式（通常是不可见的）。
% 例如，临近像素点之间的差值可以用来表示一副图像，这种类型的变换被称为映射。如果原始图像可以从变换的数据集重建，
% 他们就被称为可逆映射。

% 预测编码：它是通过消除紧邻像素在空间和时间上的冗余来实现的。它仅对每个像素中的新信息进行提取和编码。
% 一个像素的新信息定义为该像素的实际值与预测值之间的差，称为误差，然后使用变长码来对误差进行编码压缩。
%解码器接收到变长码字后重建en（误差），然后执行反操作以重建原始输入序列。

% 1，一维线性预测编码：用于预测的m个样本来自当前扫描行
% 2，二维线性预测编码：用于预测的m个样本来自当前行和前几个扫描行。
% 3，三维线性预测编码：用于预测的m个样本来自当前图像和前几幅图像。

%使用1阶线性预测器(前像素预测器)编码第二张图中的图像，使用预测系数1
e = mat2lpc(f2); %lpc 表示线性预测编码
figure, imshow(mat2gray(e));
%disp(entropy(e)); %entropy 用来求一幅灰度图的熵
disp(ntrop(e));
%这里显示出来的预测误差的熵e（5.9727bit/pixel）比原始图像的f2的熵（7.3505bit/pixel）要小。
%尽管m bit的图像需要m+1 个bit以准确表示造成的误差序列，熵的减少意味着预测误差图像可以比原始图像
%更有效地进行编码。

c = mat2huff(e);
cr = imratio(f, c);
disp(cr); %压缩率为1.3311，比直接对灰度级进行huffman编码时（压缩率为1.0821）高


%预测误差e的直方图
[h, x] = hist(e(:)*512, 512);
figure, bar(x, h, 'k');  %观察直方图，可得如下结论：0周围的峰值很高，与输入图像的灰度级分布
%相比有相对较小的方差。这反映出正如前面计算的熵值那样，由预测和微分处理移去了大量的像素间冗余

%预测编码的无损特性
g = lpc2mat(huff2mat(c)); %c是误差的huffman编码, 解码误差
compare(f2, g) %与开始图像比较，结果为0，证明是无损的



%前面的例子说明，预测编码达到的压缩与将输入图像映射到一个预测误差序列所得到的熵的减少直接相关，通常称为预测残差。因为通过预测和差分处理消除了
%空间冗余，所以，预测残差的概率密度函数通常在0处会有一个很高的峰值，并由一个相对较小的方差来表征。
