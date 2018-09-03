function [ output ] = neural_match(t1,t2,input,label,mtime)
[m,n]=size(t1);
for i=1:mtime
    k=randi(4);
    if k==1
       r=randi(n-2);
       f=t1;
       for j=1:r
           d=randi(n-2);
           f(m,d)=rand(1);
           s=randi(2);
           if s==2
               f(m,d)=-f(m,d);
           end
       end
    end
    if k==2
       r=randi(n-2);
       f=t1;
       for j=1:r
           d=randi(n-2);
           f(m,d)=t2(1,randi(n-2));
       end 
    end
    if k==3
       f=t1;
       r1=randi(n-2);
       r2=randi(n-2);
       temp=f(1,r1);
       f(1,r1)=f(1,r2);
       f(1,r2)=temp;
    end
    if k==4
       f=t1;
       r1=randi(n-2);
       r2=randi(n-2);
       if r2<r1
           temp=r2;
           r2=r1;
           r1=temp;
       end
       temp=f(1,r2);
       for j=r1+1:r2
           f(1,j)=f(1,j-1);
       end
       f(1,r1)=temp;
    end
    f=neural_score(f,input,label);
    if f(1,n)<=t1(1,n)
        t1=f;
    end
end
output=t1;
end

