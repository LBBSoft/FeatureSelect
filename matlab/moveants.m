function [ output,output2 ] = moveants( ants,bests,input,label,tp,sv,erate )
[a,b]=size(bests);
[m,n]=size(ants);
ants(:,n-2)=0;
for i=1:m
    flag=0;
    for j=1:a
        if ants(i,:)==ants(j,:)
            flag=1;
        end
    end
    if flag==1
        ants(i,n-2)=1; 
    end
end
for i=1:m
    if ants(i,n-2)==0
         k=randi(a);
         f1=randi(b-4);
         f2=randi(b-4);
         if f1>f2
             c=f1;
             f1=f2;
             f2=c;
         end
         ants(i,f1:f2)=bests(k,f1:f2);
         va=ants(i,n-1);
         ants(i,1:n)=score(ants(i,1:n),input,label,tp,sv);
         if ants(i,n-1)<va
            bests(k,b)=bests(k,b)+1; 
         end
         if ants(i,n-1)>=va
            bests(k,b)=bests(k,b)-1; 
         end
    end
end
ant=ants;
for j=1:a
    [m,n]=size(ants);
    if bests(j,b)<=0
       mi=ants(1,n-1);
       dd=1;
       for r=2:m
           if (ants(2,n-1)<=mi)
               mi=ants(r,n-1);
               dd=r;
           end
       end
       bests(j,1:b-1)=ants(dd,:);
       bests(j,b)=erate;
       ants(dd,:)=[];
    end
end
output=ant;
output2=bests;
end