%演示ntrop计算图片的熵
f = [119 123 168 119;
     123 119 168 168];
 
 f = [f;
      119 119 107 119;
      107 107 119 119];
  
 p = hist(f(:), 8);
 p = p/sum(p);
 disp(p);
 
 h = ntrop(f); % hi= -pi * log(pi); 如果log的底数取为2，则熵的单位是bit每像素，即bit/pixel
 disp(h);