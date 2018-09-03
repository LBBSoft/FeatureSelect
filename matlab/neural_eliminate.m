function [ output ] = neural_eliminate(teams,input,label,mtime)
[m,n]=size(teams);
while m>1
      f1=randi(m);
      f2=randi(m);
      t1=teams(f1,:);
      t2=teams(f2,:);
      t1=neural_match(t1,t2,input,label,mtime);
      t2=neural_match(t2,t1,input,label,mtime);
      if t1(1,n)<t2(1,n)
          teams(f2,:)=[];
      else
          teams(f1,:)=[];
      end
      [m,n]=size(teams);
end
output=teams;
end

