H = fftshift(lpfilter('gaussian', 500, 500, 50));

mesh(double(H(1:10:500, 1:10:500)));
axis tight;
colormap([0 0 0]);
axis off;
%view(-25, 30);
view(-25, 0);
shading interp;