function [ output ] = selectionga( population,nn )
[m,n]=size(population);
ne=population;
k=round(m/5);
for i=1:round(k*4/5)
     mi=population(1,n-1);
     [a,b]=size(population);
     s=1;
     for j=2:a
         if population(j,n-1)<mi 
             s=j;
             mi=population(j,n-1);
         end
     end
     ne(i,:)=population(s,:);
     population(s,:)=[];
end
ne(round(k*4/5)+1:m,:)=initial(ne(round(k*4/5)+1:m,:),nn);
output=ne;
end

