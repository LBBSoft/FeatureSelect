function [ output ] = matchlcamain( first1,second1,mtime,input,label,tp,sv)
      first=first1;
      second=second1;
      [m,n]=size(first);
      [m1,n1]=size(input);
      for t=1:mtime
          s=randi(2);
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
      end
      output=first1;
end

