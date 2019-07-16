%»ô·òÂü±àÂë¼°½âÂëÑİÊ¾
f = imread('Fig0804(a).tif');
imshow(f);
c = mat2huff(f);
cr1 = imratio(f, c);
disp(cr1);

save SqueezeTracy c;

g = huff2mat(c);
rmse = compare(f, g);
disp(rmse);