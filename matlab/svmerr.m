function [ o1,o2 ] = svmerr(teams,input,dp,label,sv)
[m,n]=size(teams);
team=[];
dp=dp/100;
for i=1:n-3
    flag=1;
    for j=1:i-1
        if teams(m,i)==teams(m,j)
           flag=0;
           break;
        end
    end
    if flag==1
       team=[team,teams(1,i)]; 
    end
end
pssmtrain=[];
[m,n]=size(team);
[a,b]=size(input);
for j=1:n
    pssmtrain=[pssmtrain,input(:,team(1,j))]; 
end
model = svmtrain(label(1:fix(a*dp),1),pssmtrain(1:fix(a*dp),:),sv);
[p, accuracy_L,d] = svmpredict(label(fix(a*dp):a,1), pssmtrain(fix(a*dp):a,:), model);
o1=accuracy_L(2);
o2=accuracy_L(3);
end