function [ output ] = convection(molecules,r,input,label,tp,sv,cof,g,noi)
[m,n]=size(molecules);
[a,b]=size(input);
if g<=noi/cof
    tcf=abs(1/3-rand(1));
else
    tcf=round(1+rand(1));
end
for i=1:m
   xs=mean(molecules(i,n-3));
   xms=mean(mean(molecules(:,n-3)));
   r=randi(334)+665;
   r=r/1000;
   cos=r*(xs-xms*tcf);
   cos=round(cos);
   s1=molecules(i,:);
   for j=1:n-3
       s1(1,j)=rem(s1(1,j)+cos,b);
       if s1(1,j)<=0
           s1(1,j)=1;
       end
   end
   s1=score(s1,input,label,tp,sv);
   if s1(1,n-1)<molecules(i,n-1)
       molecules(i,:)=s1;
   end
end
output=molecules;
end

