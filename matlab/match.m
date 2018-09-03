function [ output ] = match( first1,second1,mtime,input,label,tp,sv,nn)
      first=first1;
      second=second1;
      [m,n]=size(first);
      [m1,n1]=size(input);
      for t=1:mtime
          s=randi(4);
          if (s==1)
             k=randi(n-3);
             for e=1:k
                f=randi(n-3);
                s=randi(n-3);
                first(1,f)=second(1,s);
             end
             first=score(first,input,label,tp,sv);
             if first(1,n-1)<=first1(1,n-1)
                 first1=first;
             end
          end
          if (s==2)
             k=randi(n-3);
             for e=1:k
                f=randi(n-3);
                first(1,f)=randi(n1);
             end
             first=score(first,input,label,tp,sv);
             if first(1,n-1)<=first1(1,n-1)
                 first1=first;
             end
          end
          if (s==3)
             f=randi(n-3);
             for j=1:f
                 first(1,randi(n-3))=randi(nn); 
             end
             first=score(first,input,label,tp,sv);
             if first(1,n-1)<=first1(1,n-1)
                 first1=first;
             end
          end
          if (s==4)
             k=randi(n-3);
             s=randi(n-3);
             if s<k
                 c=s;
                 s=k;
                 k=c;
             end
             aa=[1 -1];
             for e=k:s-1
                first(1,e)=first(1,e)+aa(1,randi(2));
                if first(1,e)>nn
                    first(1,e)=nn;
                end
                if first(1,e)==0
                    first(1,e)=1;
                end
             end
             
             first=score(first,input,label,tp,sv);
             if first(1,n-1)<=first1(1,n-1)
                 first1=first;
             end
          end
      end
      output=first1;
end

