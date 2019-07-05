f = imread('Fig0923(a).tif');
imshow(f);

se = strel('square', 3);
gd = imdilate(f, se); %膨胀之后图像模糊了一些
figure, imshow(gd);

ge = imerode(f, se);
figure, imshow(ge);

morph_grad = gd - ge; %从图像的膨胀结果中减去腐蚀过的图像可产生“形态学梯度”
figure, imshow(morph_grad); %形态学梯度图，有边缘加强特征


