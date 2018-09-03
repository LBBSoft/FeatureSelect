function [ output ] = selectbest(particles,bests)
[a,b]=size(bests);
[m,n]=size(particles);
for i=1:a
    mi=particles(1,n-1);
    k=1;
    [m,n]=size(particles);
    for j=2:m
        if particles(j,n-1)<mi
            mi=particles(j,n-1);
            k=j;
        end
    end
    bests(i,:)=particles(k,:);
    particles(k,:)=[];
end
output=bests;
end

