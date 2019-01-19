function [ output ] = entropy( data,nof )
[m,n]=size(data);
data=round(data);
data(isnan(data))=0;
data=data+1;
data=[1:n;data];
m=m+1;
ent=zeros(1,n);
for i=1:n
    x=data(2:m,i);
    ma=max(x);
    p=zeros(1,ma);
    k=length(x);
    for j=1:k
        p(1,x(j,1))=p(1,x(j,1))+1;
    end
    s=0;
    for j=1:ma
        if p(j)~=0
            s=s-p(j)*log2(p(j));
        end
    end
    ent(1,i)=s;
end
while n>nof
    s=min(ent);
    for i=1:n
        if ent(1,i)==s
           k=i;
           break;
        end
    end
    ent(:,k)=[];
    data(:,k)=[];
    [m,n]=size(data);
end
output=data(1,:);
end