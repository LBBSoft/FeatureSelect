function [ output ] = initial( teams,k )
[m,n]=size(teams);
n=n-3;
for i=1:m
   a=1:k;
   for j=1:n 
       [r,d]=size(a);
       c=randi(d);
       teams(i,j)=a(r,c);
       a(:,c)=[];
   end
end
output=teams;
end

