function [ output ] = updateimper(countries,imper)
[m,n]=size(countries);
[a,b]=size(imper);
for i=b:-1:1
    k=imper(1,i);
    if countries(k,n-2)~=k
        p=countries(k,n-2);
        for j=1:m
            if countries(j,n-2)==p
                countries(j,n-2)=k;
            end
        end
    end
end
output=countries;
end

