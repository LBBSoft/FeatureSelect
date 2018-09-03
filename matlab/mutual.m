function [ output ] = mutual( data,nof )
[m,n]=size(data);
data=round(data)+1;
data=[1:n;data];
m=m+1;
mu=zeros(n,n);
for i=1:n
    for j=i+1:n
        x=data(2:m,i);
        y=data(2:m,j);
        ma=max(max([x,y]));
        px=zeros(1,ma);
        py=px;
        pxy=zeros(ma,ma);
        k=length(x);
        for r=1:k
            px(x(r))=px(x(r))+1;
            py(y(r))=py(y(r))+1;
        end
        for f1=1:ma
            if px(f1)~=0
                for f2=1:ma
                    if py(f2)~=0
                       k=length(x);
                       for f3=1:k
                           if x(f3)==f1 && y(f3)==f2
                               pxy(f1,f2)=pxy(f1,f2)+1;
                           end
                       end
                    end
                end
            end
        end
        c=0;
        px=px/k;
        py=py/k;
        pxy=pxy/k;
        for f1=1:ma
            if px(f1)~=0
                for f2=1:ma
                    if py(f2)~=0
                        if pxy(f1,f2)~=0
                            c=c+pxy(f1,f2)*log(pxy(f1,f2)/(px(f1)*py(f2)));
                        end
                    end
                end
            end
        end
        mu(j,i)=c;
        mu(i,j)=c;
    end
end
mi=min(min(mu));
for i=1:n
    mu(i,i)=mi;
end
while n>nof
    s=sum(mu);
    [a,b]=size(s);
    ma=max(s);
    for i=1:b
        if s(a,i)==ma
            k=i;
            break;
        end
    end
    data(:,k)=[];
    mu(:,k)=[];
    mu(k,:)=[];
    [m,n]=size(data);
end
output=data(1,:);
end