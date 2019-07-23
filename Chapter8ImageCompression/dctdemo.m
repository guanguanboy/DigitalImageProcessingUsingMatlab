%��ʾ��ɢ���ұ任����ͼ��ѹ��
%https://ww2.mathworks.cn/help/images/discrete-cosine-transform.html

%����dct
%https://www.zhihu.com/question/23792822/answer/34658276  ����DCTΪʲô������Ƶ�׷���
%https://www.zhihu.com/question/26244854/answer/34659868
%����ΪʲôDCT��FFt�任���и��õ������ۼ���
%Read an image into the workspace and convert it to class double.
I = imread('cameraman.tif');
I = im2double(I);

%Compute the two-dimensional DCT of 8-by-8 blocks in the image. The function dctmtx returns the N-by-N DCT transform matrix.
T = dctmtx(8);
dct = @(block_struct) T * block_struct.data * T';
B = blockproc(I,[8 8],dct);

%Discard all but 10 of the 64 DCT coefficients in each block.
%The DCT has the property that, for a typical image, most of the visually significant information 
%about the image is concentrated in just a few coefficients of the DCT. For this reason, 
%the DCT is often used in image compression applications.
%��ɢ���ұ任��һ�����ʣ�����һ�ŵ��͵�ͼƬ����������ӵ���Ҫ��Ϣ������������DCT�任��ϵ���У��������ԭ��
%��ɢ���ұ任����������ͼ��ѹ���С����������������Ϊ�˱�����ɢ���ұ任��ϵ����
mask = [1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];
B2 = blockproc(B,[8 8],@(block_struct) mask .* block_struct.data);

%Reconstruct the image using the two-dimensional inverse DCT of each block.
invdct = @(block_struct) T' * block_struct.data * T;
I2 = blockproc(B2,[8 8],invdct);

%Display the original image and the reconstructed image, side-by-side. Although there is some loss of quality in the reconstructed image, it is clearly recognizable, even though almost 85% of the DCT coefficients were discarded.
imshow(I)
figure, imshow(I2)


