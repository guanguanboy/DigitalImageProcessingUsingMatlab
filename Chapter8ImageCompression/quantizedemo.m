
%����һ����������IGS����������Ԥ�����ͻ�����������ѹ��ͼ��ʹ�ý����ԭʼͼ���1/4��С��
f = imread('Fig0810(a).tif');
imshow(f);

q = quantize(f, 4, 'igs');
qs = double(q)/16;
e = mat2lpc(qs);
c = mat2huff(e);
imratio(f, c)

%�ѱ���Ľ��cͨ���෴�Ĳ�������ѹ�������ý��з�������
ne = huff2mat(c);
nqs = lpc2mat(ne);
nq = 16 * nqs;
compare(q, nq) %ֵΪ0�� 
figure, imshow(nq);

compare(f, nq) %ֵΪ6.8382����ѹ��ͼ��ľ���������Լ��7���Ҷȼ���������Դ����������