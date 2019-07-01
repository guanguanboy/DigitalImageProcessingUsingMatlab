f = imread('Fig0518(a).tif'); %待配准图像
g = imread('Fig0518(b).tif'); %参考图像

%cpselect(f, g);%第一个参数是待配准图像，第二个参数是参考图像

s = load('cpselect-results1');

cpstruct = s.cpstruct1;

tform = cp2tform(cpstruct, 'affine');

figure,visreg(g, f, tform); %第一个参数是参考图像，第二个参数是待配准图像