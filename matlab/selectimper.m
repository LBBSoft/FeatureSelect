function [ output ] = selectimper(countries,imper)
[a,b]=size(imper);
for i=1:b
    [m,n]=size(countries);
    mi=countries(1,n-1);
    s=1;
    for j=2:m
        if countries(j,n-1)<mi
            mi=countries(j,n-1);
            s=j;
        end
    end
    imper(1,i)=s;
    countries(s,:)=[];
end
for i=1:b
    for j=i+1:b
        if imper(1,i)<=imper(1,j)
            imper(1,j)=imper(1,j)+1;
        end
    end
end
output=imper;
end

