function [ output ] = moveica( countries,imper )
   [m,n]=size(countries);
   countries(:,n-2)=0;
   [a,b]=size(imper);
   for i=1:b
       countries(imper(1,i),n-2)=imper(1,i);
   end
   for i=1:m
       if countries(i,n-2)==0
          k=randi(b);
          countries(i,n-2)=imper(1,k);
       end
   end
   for i=1:m
       d=countries(i,n-2);
       s1=randi(n-3);
       s2=randi(n-3);
       if s1>s2
           c=s1;
           s1=s2;
           s2=s1;
       end
       countries(i,s1:s2)=countries(d,s1:s2);
   end
   output=countries;
end

