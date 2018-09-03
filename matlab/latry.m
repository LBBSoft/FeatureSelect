function [ output ] = latry( la,mtime,input,label,tp,sv,nn )
  [m,n]=size(la);
  for i=1:mtime
      j=randi(nn);
      la1=la;
      for k=1:m
          la1(1,randi(n-3))=randi(nn);
      end
      la1=score(la1,input,label,tp,sv);
      if la1(1,n-1)<=la(1,n-1)
          la=la1;
      end
  end
  output=la;
end