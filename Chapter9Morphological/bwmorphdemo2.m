%��������������ͼ��,��һ�ּ��ٶ�ֵͼ���е�����Ϊһ��ϸ���ʻ����ķ�������Щϸ�����Ա���ԭʼ������״����Ҫ��Ϣ��
f = imread('Fig0916(a).tif');
imshow(f);
fs = bwmorph(f, 'skel', Inf); %�ظ�����ֱ���ȶ�
figure, imshow(fs);

fspur = bwmorph(fs, 'spur', 5); %ȥ��ë������
figure, imshow(fspur);

%��������ϸ���Ĺ��̾��������̵��޹ص�ë�̣�ȥ��ë�̵Ĺ��̳�Ϊ�ü���Ҳ����ʹ��
%����endpoints���ﵽ���Ŀ�İ��������Ƿ���ȷ�ϲ�ȥ���˵㡣

for k = 1:5
    fs = fs & ~endpoints(fs); %ͨ��5��ȥ���˵�ĵ��������Ժ��������ͼ��fs��
end

figure, imshow(fs);