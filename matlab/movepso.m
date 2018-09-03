function [ output ] = movepso( particles,bests )
[a,b]=size(bests);
[m,n]=size(particles);
particles(:,n-2)=0;
for i=1:m
    flag=0;
    for j=1:a
        if particles(i,:)==particles(j,:)
            flag=1;
        end
    end
    if flag==1
        particles(i,n-2)=1; 
    end
end
for i=1:m
    if particles(i,n-2)==0
         k=randi(a);
         f1=randi(b-3);
         f2=randi(b-3);
         if f1>f2
             c=f1;
             f1=f2;
             f2=c;
         end
         particles(i,f1:f2)=bests(k,f1:f2);
    end
end
output=particles;
end

