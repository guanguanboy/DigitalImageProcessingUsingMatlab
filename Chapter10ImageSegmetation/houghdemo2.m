f = imread('gCanny_best.tif');
[H, theta, rho] = hough(f, 'ThetaResolution', 0.2);
figure, imshow(H, [], 'XData', theta, 'YData', rho, 'InitialMagnification', 'fit');
axis on;
axis normal;
xlabel('\theta');
ylabel('\rho');

%��houghpeaksѰ��5���������hough�任�ķ�ֵ��
peaks = houghpeaks(H, 5);
hold on;
plot(theta(peaks(:, 2)), rho(peaks(:, 1)), 'linestyle', 'none', 'marker', 's', 'color', 'w');

%ʹ�ú���houghlinesѰ�Һ������߶Σ��ú���imshow��hold on��plot��ԭʼ�Ķ�ֵͼ��������߶Σ�
lines = houghlines(f, theta, rho, peaks);
figure, imshow(f);
hold on;
for k = 1:length(lines)
	xy = [lines(k).point1, lines(k).points2];
	plot(xy(:, 1), xy(:, 2), 'LineWidth', 4, 'Color', [.8 .8 .8]);
	
end