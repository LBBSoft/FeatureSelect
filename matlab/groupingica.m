function [ output ] = groupingica( countries,nogr,noc)
[m,n]=size(countries);
groups=ones(1,noc);
k=fix(m/nogr);
j=1;
for i=1:nogr
    groups(1,(i-1)*k+1:i*k)=j;
    j=j+1;
end
for i=1:m
    [a,b]=size(groups);
    k=randi(b);
    countries(i,n-2)=groups(1,k);
    groups(:,k)=[];
end 
output=countries;
end

