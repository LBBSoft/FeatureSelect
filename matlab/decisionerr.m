function [ o1,o2 ] = decisionerr(teams,input,dp,label)
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
 model = fitrtree(pssmtrain(1:fix(a*dp),:),label(1:fix(a*dp),1));
 p = predict(model,pssmtrain(fix(a*dp):a,:));
label=label(fix(a*dp):a,1);
er=p-label;
er=power(er,2);
er=sum(er);
i1=length(label);
er=er/i1;
er=sqrt(er);
o1=er;
o2=corr2(p,label);
end