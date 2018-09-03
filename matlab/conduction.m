function [ output ] = conduction( molecules,r,input,label,tp,sv,cdf,g,noi )
[m,n]=size(molecules);
[a,b]=size(input);
if g<=noi/cdf
    r=rand(1);
else
    r=1/3;
end
for i=1:m
    s=randi(m);
    s1=molecules(s,:);
    s2=molecules(i,:);
    if s1(1,n-1)<s2(1,n-1)
        for j=1:n-3
            cds=-round(r*r*s1(1,j));
            s2(1,j)=rem(s2(1,j)+cds,b+1);
            if s2(1,j)==0
                s2(1,j)=1;
            end
        end
        s2=score(s2,input,label,tp,sv);
    else
        for j=1:n-3
            cds=-round(r*r*s2(1,j));
            s1(1,j)=rem(s1(1,j)+cds,b+1);
            if s1(1,j)==0
                s1(1,j)=1;
            end
        end
        s1=score(s1,input,label,tp,sv);
    end
    if molecules(i,n-1)>s2(1,n-1)
        molecules(i,:)=s2(1,:);
    end
    if molecules(s,n-1)>s1(1,n-1)
        molecules(s,:)=s1(1,:);
    end
end
output=molecules;
end

