function [ output ] = neural_grouping(teams,nog)
[m,n]=size(teams);
k=zeros(1,m);
k(:)=nog;
r=fix(m/nog);
c=1;
for i=1:r:m
    k(1,(i-1)*r+1:i*r)=c;
    c=c+1;
end
for i=1:m
   [a,b]=size(k);
   d=randi(b);
   teams(i,n-1)=k(1,d);
   k(:,d)=[];
end
output=teams;
end

