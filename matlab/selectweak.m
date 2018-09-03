function [ output ] = selectweak(countries,imper)
w=imper(1,1);
[m,n]=size(countries);
ma=countries(w,n-1);
[a,b]=size(imper);
for i=2:b
    if countries(imper(1,i),n-1)>ma
        ma=countries(imper(1,i),n-1);
        w=imper(1,i);
    end
end
output=w;
end

