f = imread('lena.tif'); %参考图像
g = imread('lena_rotated.tif'); %待配准图像
subplot(2,2,1),imshow(f);

subplot(2,2,2),imshow(g);

% cpselect(g, f); %cpselect(moving,fixed),第一个参数是待配准图像，第二个参数是参考图像
% save cpselect-results cpstruct %将cpstruct保存为cpselect-results.mat文件中
s = load('cpselect-results');
cpstruct = s.cpstruct;
tform = cp2tform(cpstruct, 'affine');

% tform = cp2tform(movingPoints2, fixedPoints2, 'affine');
% %cp2tform的第二种调用方法
% figure,visreg(f, g, tform); %第一个参数是参考图像，第二个参数是待配准图像
out = imtransform(g, tform);
subplot(2,2,3), imshow(out);
