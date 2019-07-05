%��ʾ�����ȡͼƬ�е���ͨ���������������ʾÿ����ͨ����������
f = imread('Fig0917(a).tif');
[L, n] = bwlabel(f);

[r, c] = find(L == 3); % ʹ��find�������ڵ�����������������ص���������

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

