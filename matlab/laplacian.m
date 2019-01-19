function [ output ] = laplacian( data,nof )
[m,n]=size(data);
data=[1:n;data];
data(isnan(data))=0;
m=m+1;
lap=zeros(n,n);
kd=data(2:m,:)';
nog=round(n/5);
label=kmeans(kd,nog);
for i=1:n
    for j=i+1:n
        x=data(2:m,i);
        y=data(2:m,j);
        k=length(x);
        c=0;
        if label(i,1)==label(j,1)
            s=-sum(power(x-y,2));
            ma=max(max([x,y]));
            mi=min(min([x,y]));
            v=ma-mi;
            s=s/v;
            c=exp(s);
        end
        if isnan(c)
            c=0;
        end
        lap(j,i)=c;
        lap(i,j)=c;
    end
end
mi=min(max(lap));
for i=1:n
    lap(i,i)=mi;
end
while n>nof
    s=sum(lap);
    [a,b]=size(s);
    ma=max(s);
    for i=1:b
        if s(a,i)==ma
            k=i;
            break;
        end
    end
    data(:,k)=[];
    lap(:,k)=[];
    lap(k,:)=[];
    [m,n]=size(data);
end
output=data(1,:);
end