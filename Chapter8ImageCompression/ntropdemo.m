%��ʾntrop����ͼƬ����
f = [119 123 168 119;
     123 119 168 168];
 
 f = [f;
      119 119 107 119;
      107 107 119 119];
  
 p = hist(f(:), 8);
 p = p/sum(p);
 disp(p);
 
 h = ntrop(f); % hi= -pi * log(pi); ���log�ĵ���ȡΪ2�����صĵ�λ��bitÿ���أ���bit/pixel
 disp(h);