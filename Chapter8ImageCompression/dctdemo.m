%演示离散余弦变换用于图像压缩
%https://ww2.mathworks.cn/help/images/discrete-cosine-transform.html

%关于dct
%https://www.zhihu.com/question/23792822/answer/34658276  解释DCT为什么不能做频谱分析
%https://www.zhihu.com/question/26244854/answer/34659868
%解释为什么DCT比FFt变换具有更好的能量聚集度
%Read an image into the workspace and convert it to class double.
I = imread('cameraman.tif');
I = im2double(I);

%Compute the two-dimensional DCT of 8-by-8 blocks in the image. The function dctmtx returns the N-by-N DCT transform matrix.
T = dctmtx(8);
dct = @(block_struct) T * block_struct.data * T';
B = blockproc(I,[8 8],dct);

%Discard all but 10 of the 64 DCT coefficients in each block.
%The DCT has the property that, for a typical image, most of the visually significant information 
%about the image is concentrated in just a few coefficients of the DCT. For this reason, 
%the DCT is often used in image compression applications.
%离散余弦变换有一个性质，对于一张典型的图片，大多数可视的重要信息集中在少数的DCT变换的系数中，由于这个原因
%离散余弦变换经常被用在图像压缩中。下面的这个掩码就是为了保留离散余弦变换的系数。
mask = [1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];
B2 = blockproc(B,[8 8],@(block_struct) mask .* block_struct.data);

%Reconstruct the image using the two-dimensional inverse DCT of each block.
invdct = @(block_struct) T' * block_struct.data * T;
I2 = blockproc(B2,[8 8],invdct);

%Display the original image and the reconstructed image, side-by-side. Although there is some loss of quality in the reconstructed image, it is clearly recognizable, even though almost 85% of the DCT coefficients were discarded.
imshow(I)
figure, imshow(I2)


