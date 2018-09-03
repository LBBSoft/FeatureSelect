function [ output ] = groupmatch( teams,mtime,input,label,tp,sv,nn )
  [m,n]=size(teams);
  for i=1:m
      for j=i+1:m
          if teams(i,n-2)==teams(j,n-2)
             teams(i,:)=match(teams(i,:),teams(j,:),mtime,input,label,tp,sv,nn);
          end
      end
  end
  output=teams;
end