function [ output ] = globalseeding(trees,bests,input,label,tp,sv)
[m,n]=size(trees);
[a,b]=size(bests);
for i=1:a
    k=randi(m);
    trees1=trees(k,:);
    r=randi(n-3);
    for j=1:r
        trees1(1,randi(n-3))=bests(i,randi(n-3));
    end
    trees1=score(trees1,input,label,tp,sv);
    if trees1(1,n-1)<=trees(k,n-1)
       trees(k,:)=trees1;
    end
end
output=trees;
end

