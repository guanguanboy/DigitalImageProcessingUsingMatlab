f = imread('Fig0518(a).tif'); %����׼ͼ��
g = imread('Fig0518(b).tif'); %�ο�ͼ��

%cpselect(f, g);%��һ�������Ǵ���׼ͼ�񣬵ڶ��������ǲο�ͼ��

s = load('cpselect-results1');

cpstruct = s.cpstruct1;

tform = cp2tform(cpstruct, 'affine');

figure,visreg(g, f, tform); %��һ�������ǲο�ͼ�񣬵ڶ��������Ǵ���׼ͼ��