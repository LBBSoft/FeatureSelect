function [ output ] = crossoverga( population,crate )
[m,n]=size(population);
k=round(m/crate*100);
for i=1:k
   d1=randi(m);   
   d2=randi(m);
   r1=randi(n-3);
   r2=randi(n-3);
   if r2<r1
       c=r2;
       r2=r1;
       r1=c;
   end
   c=population(d1,r1:r2);
   population(d1,r1:r2)=population(d2,r1:r2);
   population(d2,r1:r2)=c;
end
output=population;
end

