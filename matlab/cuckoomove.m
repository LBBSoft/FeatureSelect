function [ output ] = cuckoomove(eggs,input,label,tp,sv,nc)
[m,n]=size(eggs);
for i=1:nc
    a=randi(m);
    b=randi(m);
    while (eggs(a,n-2)==eggs(b,n-2))
        b=randi(m);
    end
    d=randi(n-3);
    egg=eggs(a,:);
    for j=1:d
        egg(1,randi(n-3))=eggs(b,randi(n-3)); 
    end
    egg=score(egg,input,label,tp,sv);
    if egg(1,n-1)<eggs(a,n-1)
        eggs(a,:)=egg;
    end
end
output=eggs;
end

