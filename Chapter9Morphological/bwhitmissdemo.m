%��ʾ���л����б任��bwhitmiss
bw = [0 0 0 0 0 0
      0 0 1 1 0 0
      0 1 1 1 1 0
      0 1 1 1 1 0
      0 0 1 1 0 0
      0 0 1 0 0 0];
  
  interval = [0 0 0
            1  1 0
            0  1  0];
        
  bw2 = bwhitmiss(bw, interval);
  
  interval1 = [0 1 1
            0  0 1
            0  0  0];
        
  bw3 = bwhitmiss(~bw, interval1);
  
  interval2 =  [0 -1 -1
            1  1 -1
            0  1  0];
        
 bw4 = bwhitmiss(bw,interval2);
 
 %�ӽ�����Կ�����bw3��bw4��һ���ģ�Ҳ����˵BW2 = bwhitmiss(BW,interval) �൱��
 %bwhitmiss(BW,interval==1,interval==-1)��Ҳ����imerode(BW,SE1) & imerode(~BW,SE2)
 %����SE1��interval�� SE2��interval1
 %��˻��л����б任�ɽ���Ϊ����1����SE1��ʴBW������2����SE2��ʴBW�Ĳ�����Ȼ����ò���1�Ͳ���2�Ľ���������������Ǽ��л����б任�Ľ����
 
 
  
  