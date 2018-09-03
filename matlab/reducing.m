im=importdata('BASEHOCK.mat');
[a,b]=size(im);
crr=zeros(a,a);
for i=1:a
   for j=1:a
       c=corr2(im(i,2:b),im(j,2:b));
       crr(i,j)=c;
       crr(j,i)=c;
   end
end
m=min(min(crr));
for i=1:a
    crr(i,i)=m;
end
[a,b]=size(crr);
while a>300
   m=max(max(crr));
   for i=1:a
       for j=1:a
           if crr(i,j)==m
               k=i;
               break;
           end
       end
   end
   crr(k,:)=[];
   crr(:,k)=[];
   im(k,:)=[];
   [a,b]=size(im);
end