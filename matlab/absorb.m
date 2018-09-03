function [ output] = absorb(countries,w,imper)
[m,n]=size(countries);
[a,b]=size(imper);
s=1;
for i=2:b
    if imper(1,i)==w
        s=i;
    end
end
imper(:,s)=[];
[a,b]=size(imper);
for i=1:m
    if countries(i,n-2)==w
        d=randi(b);
        countries(i,n-2)=imper(1,d);
    end
end
output=countries;
end

