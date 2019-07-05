%演示击中击不中变换，bwhitmiss
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
 
 %从结果可以看出，bw3与bw4是一样的，也就是说BW2 = bwhitmiss(BW,interval) 相当于
 %bwhitmiss(BW,interval==1,interval==-1)，也就是imerode(BW,SE1) & imerode(~BW,SE2)
 %其中SE1是interval， SE2是interval1
 %因此击中击不中变换可解释为操作1：用SE1腐蚀BW，操作2：用SE2腐蚀BW的补集，然后求得操作1和操作2的交集（这个交集就是集中击不中变换的结果）
 
 
  
  