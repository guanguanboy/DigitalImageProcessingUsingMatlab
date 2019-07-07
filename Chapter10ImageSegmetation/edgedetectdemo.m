f = imread('Fig1006(a).tif');
imshow(f);

[gv, t] = edge(f, 'sobel', 'vertical');
 
figure, imshow(gv); %��ͼ���п��Կ����������Ҫ��Ե�Ǵ�ֱ��Ե����б�ı�Ե�д�ֱ��ˮƽ����������Ҳ�ܱ���⵽
disp(t); %disp ����������������������д��ڣ����������ֵ

gv = edge(f, 'sobel', 0.15, 'vertical'); %����ָ���ϸߵ���ֵ���Ӷ��ѽ����ı�Եȥ��

figure, imshow(gv);

%ͬʱ���ˮƽ��Ե�ʹ�ֱ��Ե����ʹ����ʽ
gboth = edge(f, 'sobel', 0.15);
figure, imshow(gboth);
title('gboth');

%edge���ܼ��45�ȱ�Ե������ʹ��imfilter������
weg45 = [-2 -1 0;
         -1 0 1
         0 1 2];
gneg45 = imfilter(tofloat(f), weg45, 'replicate');
T = 0.3 * max(abs(gneg45(:)));
gneg45 = (gneg45>= T);
figure, imshow(gneg45);
title('-45');

%���45�ȵı�Ե����ʹ����������
wpos45 = [0  1  2
          -1 0  1
          -2 -1 0];
gpos45 = imfilter(tofloat(f), wpos45, 'replicate');      
T = 0.3 * max(abs(gpos45(:)));
gpos45 = (gpos45>= T);
figure, imshow(gpos45);
title('45');
      

