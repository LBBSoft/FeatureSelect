function [ output ] = mutationga( population,mrate,nn )
[m,n]=size(population);
k=round(m/mrate*100);
for i=1:k
   d=randi(m);   
   r=randi(n-3);
   for j=1:r
       population(d,j)=randi(nn); 
   end
end
output=population;
end

