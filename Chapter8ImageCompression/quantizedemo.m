
%下面一组命令结合了IGS量化，无损预测编码和霍夫曼编码来压缩图像，使得结果比原始图像的1/4还小。
f = imread('Fig0810(a).tif');
imshow(f);

q = quantize(f, 4, 'igs');
qs = double(q)/16;
e = mat2lpc(qs);
c = mat2huff(e);
imratio(f, c)

%已编码的结果c通过相反的操作来解压缩（不用进行反量化）
ne = huff2mat(c);
nqs = lpc2mat(ne);
nq = 16 * nqs;
compare(q, nq) %值为0， 
figure, imshow(nq);

compare(f, nq) %值为6.8382，解压缩图像的均方根误差大约是7个灰度级，这个误差源于量化步骤