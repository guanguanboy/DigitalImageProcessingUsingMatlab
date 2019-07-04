se = strel('diamond', 5); %使用strel产生结构元
decomp = getsequence(se); %分解结构元
figure,imshow(se.Neighborhood); %显示结构元

