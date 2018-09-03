function [ output ] = radiation(molecules,r,input,label,tp,sv,rdf,g,noi)
[m,n]=size(molecules);
[a,b]=size(input);
for i=1:m
    k=randi(m);
    s1=molecules(i,:);
    s2=molecules(k,:);
    r=rand(1);
    if g<=noi/rdf
        r=randi(333)*2;
        r=r/1000;
    end
    if s1(1,n-1)<s2(1,n-1)
       for j=1:n-3
           rds=r*(s1(1,j)-s2(1,j)); 
           s2(1,j)=round(rem(s2(1,j)+rds,b));
           if s2(1,j)<=0
               s2(1,j)=1;
           end
       end
       s2=score(s2,input,label,tp,sv);
       if s2(1,n-1)<molecules(k,n-1)
           molecules(k,:)=s2;
       end
    end
    if s1(1,n-1)>=s2(1,n-1)
       for j=1:n-3
           rds=r*(s2(1,j)-s1(1,j)); 
           s1(1,j)=round(rem(s1(1,j)+rds,b));
           if s1(1,j)<=0
               s1(1,j)=1;
           end
       end
       s1=score(s1,input,label,tp,sv);
       if s1(1,n-1)<molecules(i,n-1)
           molecules(i,:)=s1;
       end
    end
end
output=molecules;
end

