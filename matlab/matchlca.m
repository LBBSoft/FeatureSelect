function [ output ] = matchlca( teams,mtime,input,label,tp,sv )
  [m,n]=size(teams);
  for i=1:m
      for j=i+1:m
          teams(i,:)=matchlcamain(teams(i,:),teams(j,:),mtime,input,label,tp,sv);
      end
  end
  output=teams;
end