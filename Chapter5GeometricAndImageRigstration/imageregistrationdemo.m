f = imread('lena.tif'); %�ο�ͼ��
g = imread('lena_rotated.tif'); %����׼ͼ��
subplot(2,2,1),imshow(f);

subplot(2,2,2),imshow(g);

% cpselect(g, f); %cpselect(moving,fixed),��һ�������Ǵ���׼ͼ�񣬵ڶ��������ǲο�ͼ��
% save cpselect-results cpstruct %��cpstruct����Ϊcpselect-results.mat�ļ���
s = load('cpselect-results');
cpstruct = s.cpstruct;
tform = cp2tform(cpstruct, 'affine');

% tform = cp2tform(movingPoints2, fixedPoints2, 'affine');
% %cp2tform�ĵڶ��ֵ��÷���
% figure,visreg(f, g, tform); %��һ�������ǲο�ͼ�񣬵ڶ��������Ǵ���׼ͼ��
out = imtransform(g, tform);
subplot(2,2,3), imshow(out);
