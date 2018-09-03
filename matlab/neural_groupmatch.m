function [ output ] = neural_groupmatch(teams,input,label,mtime)
[m,n]=size(teams);
for i=1:m
    for j=1:m
        if (teams(i,n-1)==teams(j,n-1))&&(i~=j)
           teams(i,:)=neural_match(teams(i,:),teams(j,:),input,label,mtime); 
        end
    end
end
output=teams;
end