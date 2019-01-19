function [ output ] = pearson_correlation( data,nof )
[m,n]=size(data);
data(isnan(data))=0;
data=[1:n;data];
m=m+1;
crr=zeros(n,n);
for i=1:n
    for j=i+1:n
        x=data(2:m,i);
        y=data(2:m,j);
        c=cov(x,y);
        c=c(1,2);
        t=sqrt(var(x)*var(y));
        c=c/t;
        if isnan(c)
            c=0;
        end
        crr(i,j)=c;
        crr(j,i)=c;
    end
end
mi=min(min(crr));
for i=1:n
    crr(i,i)=mi;
end
while n>nof
    s=sum(crr);
    [a,b]=size(s);
    ma=max(s);
    for i=1:b
        if s(a,i)==ma
            k=i;
            break;
        end
    end
    data(:,k)=[];
    crr(:,k)=[];
    crr(k,:)=[];
    [m,n]=size(data);
end
output=data(1,:);
end

