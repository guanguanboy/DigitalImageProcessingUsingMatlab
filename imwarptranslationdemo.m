f = imread('DIPUM2E_International_Ed_CH02_Images\Fig0228(a).tif');
%imshow(f);

cb_ref = imref2d(size(f));

T = [1 0 0; 0 1 0; 40 60 1];

tform = affine2d(T);

% [cb_translated,cb_translated_ref] = imwarp(f,tform);
% 
% figure;
% subplot(1,2,1);
% imshow(f,cb_ref);s
% subplot(1,2,2);
% imshow(cb_translated,cb_translated_ref)

cb_translated_ref = cb_ref;
cb_translated_ref.XWorldLimits(2) = cb_translated_ref.XWorldLimits(2)+20;
cb_translated_ref.YWorldLimits(2) = cb_translated_ref.YWorldLimits(2)+20;

[cb_translated,cb_translated_ref] = imwarp(f,tform,'OutputView',cb_translated_ref);

figure, subplot(1,2,1);
imshow(f,cb_ref);
subplot(1,2,2);
imshow(cb_translated,cb_translated_ref)

%https://www.mathworks.com/help/images/perform-a-2-d-translation-transformation.html