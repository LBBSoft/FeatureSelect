function [ output ] = hamparvari(organisms,best,input,label,tp,sv)
[m,n]=size(organisms);
k=randi(m);
for i=1:k
    r=randi(3)-2;
    s1=randi(m);
    s2=randi(m);
    first=organisms(s1,:);
    second=organisms(s2,:);
    d=randi(n-3);
    for j=1:d
        l=randi(n-3);
        first(1,l)=first(1,l)+r*(best(1,l)-second(1,l));
        first(1,l)=round(abs(rem(first(1,l),n-3)));
        if first(1,l)<=0 
            first(1,l)=1;
        end
    end
    first=score(first,input,label,tp,sv);
    if first(1,n-1)<organisms(s1,n-1)
       organisms(s1,:)=first;
    end
end
output=organisms;
end

