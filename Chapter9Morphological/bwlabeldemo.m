%演示如何提取图片中的连通分量，并计算和显示每个连通分量的质心
f = imread('Fig0917(a).tif');
[L, n] = bwlabel(f);

[r, c] = find(L == 3); % 使用find返回属于第三个物体的所有像素的行列索引

rbar = mean(r);
cbar = mean(c);

imshow(f);
hold on; %So later plotting commands plot on top of the image

for k =  1:n
    [r, c] = find(L == k); 
    rbar = mean(r);
    cbar = mean(c);
    
    plot(cbar, rbar, 'Marker', 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k', 'MarkerSize', 10);
    
    plot(cbar, rbar, 'Marker', '*', 'MarkerEdgeColor', 'w');
end

