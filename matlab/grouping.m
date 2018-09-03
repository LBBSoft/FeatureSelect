function [ output ] = grouping( teams,nogr,nteam)
[m,n]=size(teams);
groups=zeros(1,nteam);
k=fix(m/nogr);
groups(:)=nogr;
j=1;
for i=1:nogr
    groups(1,(i-1)*k+1:i*k)=j;
    j=j+1;
end
for i=1:m
    [a,b]=size(groups);
    k=randi(b);
    teams(i,n-2)=groups(1,k);
    groups(:,k)=[];
end 
output=teams;
end

