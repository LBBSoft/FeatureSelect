function [ output ] = eliminate(teams,mtime,input,label,tp,sv,nn)
[m,n]=size(teams);
mtime=mtime*10;
while(m>1)
   a=randi(m);
   b=randi(m);
   while a==b
         b=randi(m) ;
   end
   first=teams(a,:);
   second=teams(b,:);
   first=match(first,second,mtime,input,label,tp,sv,nn);
   second=match(second,first,mtime,input,label,tp,sv,nn);
   teams(a,:)=first;
   teams(b,:)=second;
   if second(1,n-1)<first(1,n-1)
       teams(a,:)=[];
   else
       teams(b,:)=[];
   end
   [m,n]=size(teams);
end
output=teams;
end

