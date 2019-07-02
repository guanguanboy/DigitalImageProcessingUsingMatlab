f = checkerboard(50);
imshow(f);
sx = 0.75;
sy = 1.25;

T = [sx 0 0
    0 sy 0
    0 0 1];

t1 = maketform('affine', T);
g1 = imtransform(f, t1);

figure, imshow(g1);

theta = pi/6;
T2 = [cos(theta) sin(theta) 0
    -sin(theta) cos(theta) 0
    0 0 1];

t2 = maketform('affine', T2);
g2 = imtransform(f, t2);
figure, imshow(g2);

T3 = [0.4788 0.0135 -0.0009
    0.0135 0.4788 -0.0009
    0.5059 0.5059 1.0000];

tform3 = maketform('projective', T3);
g3 = imtransform(f, tform3);
figure, imshow(g3);
