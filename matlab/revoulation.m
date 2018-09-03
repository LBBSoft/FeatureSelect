function [ output] = revoulation( countries,va )
[m,n]=size(countries);
n=n-3;
for i=1:m
    if not(i==countries(i,n+1))
       k=randi(n);
       for j=1:k
           d=randi(n);
           r=randi(va);
           countries(i,d)=r;
       end
    end
end
output=countries;
end

