function [ o1,o2] = selectminmax( teams )
[m,n]=size(teams);
mi=teams(1,n-1);
s=1;
for i=2:m
    if teams(i,n-1)<mi
        s=i;
        mi=teams(i,n-1);
    end
end
o1=teams(s,n-1);
o2=teams(s,n);
end

