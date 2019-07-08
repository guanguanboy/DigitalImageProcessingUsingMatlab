%理想情况下，10.1节讨论的方法应该只产生位于边缘上的像素。实际上，得到的像素因为噪声，
%以及不均匀照明引起的边缘断裂和杂散的亮度不连续而难以得到完全的边缘特性。因而，
%典型的边缘检测算法紧接着用连接过程把像素组装成有意义的边缘。一种寻找并连接图像中线段的
%方法是霍夫变换
f = zeros(101, 101);
f(1, 1) = 1;
f(101, 1) = 1;
f(1, 101) = 1;
f(101, 101) = 1;
f(51, 51) = 1;
imshow(f);

H = hough(f);
figure, imshow(H, []);

[H, theta, rho] = hough(f);
figure, imshow(H, [], 'XData', theta, 'YData', rho, 'InitialMagnification', 'fit');
axis on;
axis normal;
xlabel('\theta');
ylabel('\rho');