function [ output ] = fisher( data,nof,label )
[m,n]=size(data);
data=round(data);
data=data+1;
data=[1:n;data];
label=round(label)+1;
m=m+1;
fisher=zeros(1,n);
ma=max(label);
p=zeros(1,ma);
k=length(label);
for j=1:k
    p(1,label(j,1))=p(1,label(j,1))+1;
end
for i=1:n
    x=data(2:m,i);
    avg=p;
    avg(:)=0;
    sd=avg;
    for j=1:length(p)
        c=[];
        if p(1,j)~=0
            for r=1:length(label)
                if label(r,1)==j
                    c=[c;x(r,1)];
                end
            end
            avg(1,j)=mean(c);
            sd(1,j)=std(c);
        end
    end
    av=mean(x);
    st=std(x);
    s=0;
    for j=1:length(p)
        s=s+p(j)*(avg(j)-av);
    end
    st=st*st;
    s=s/st;
    if isnan(s)
        s=0;
    end
    fisher(1,i)=s;
end
while n>nof
    s=max(fisher);
    for i=1:n
        if fisher(1,i)==s
           k=i;
           break;
        end
    end
    fisher(:,k)=[];
    data(:,k)=[];
    [m,n]=size(data);
end
output=data(1,:);
end