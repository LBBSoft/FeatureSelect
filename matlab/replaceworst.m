function [ output ] = replaceworst(molecules,nn)
[m,n]=size(molecules);
mi=molecules(1,n-1);
ma=molecules(1,n-1);
ji=1;
ja=1;
for i=2:m
    if molecules(i,n-1)<mi
       mi=molecules(i,n-1);
       ji=i;
    end
    if molecules(i,n-1)>ma
       ma=molecules(i,n-1);
       ja=i;
    end
end
molecules(ja,:)=molecules(ji,:);
k=randi(n-3);
for i=1:k
    molecules(ja,randi(n-3))=randi(nn);  
end
output=molecules;
end

