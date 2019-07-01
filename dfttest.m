 f = imread('Fig0424(a)(rectangle).tif');
 figure,imshow(f);
 F = fft2(f); %该函数返回的傅里叶变换，数据原点在左上角，4个4分之一周期交汇于频率矩形的中心
 S = abs(F); %傅里叶谱的计算（计算数组中每个元素的幅度，实部和虚部平方和的平方根）
 figure,imshow(S, []);
 
 Fc = fftshift(F);%将变换的原点（低频成分）移动到频率矩形的中心
 figure, imshow(abs(Fc), []);
 
 S2 = log(1 + abs(Fc)); %通过对数变换增强细节
 figure, imshow(S2, []);
 
 %相角的计算
 phi = angle(F);
 figure, imshow(phi, []);
 