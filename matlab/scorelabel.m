function [ output ] = scorelabel(teams,input,label)
[m,n]=size(teams);
[i1,i2]=size(input);
nen=i2;
k=nen;
layer=nen;
while k>1
    k=fix(k/2);
    layer=[layer,k];
end
k=sum(layer);
for i=1:m
    op=zeros(i1,k);
    for j=1:i1
        for l=1:layer(1,1)
            a=teams(i,(l-1)*(i2+1)+1:l*(i2+1));
            c=a(1,1:i2).*input(j,:);
            c=sum(c);
            c=c+teams(i,l*(i2+1)+1);
            op(j,l)=c;
        end
    end
    cur=i2*layer(1,1)+layer(1,1)+1;
    [a,b]=size(layer);
    pre=i2;
    for j=2:b
        s=sum(layer(1,1:j-1));
        for r=1:layer(1,j)
            for h=1:i1
                a=op(h,s-layer(1,j-1)+1:s);
                c=teams(i,cur:cur+pre-1);
                c=c.*a;
                c=sum(c);
                c=c+teams(1,cur+pre);
                op(h,s+r)=c;
            end
            cur=cur+pre+1;
        end
        pre=layer(1,j);
    end
    er=op(:,k)-label(:,1);
    er=power(er,2);
    er=sum(er);
    er=er/i1;
    teams(i,n)=er;
end
output=op(:,k);
end

