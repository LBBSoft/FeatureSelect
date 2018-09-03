function [ o1,o2,o3,o4,o5 ] = decisiontptn(teams,input,dp,label)
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
mat=confusionmat(label,p);
cf=sum(mat');
[m,n]=size(mat);
ad=zeros(m,9);
cf=cf';
mat=[mat,ad,cf];
for i=1:m
   fp=sum(mat(:,i));
   fp=fp-mat(i,i);
   tp=mat(i,i);
   tn=sum(diag(mat(1:m,1:n)));
   tn=tn-mat(i,i);
   fn=sum(mat(i,1:n));
   fn=fn-mat(i,i);
   if fp==0
       fp=eps;
   end
   if fn==0
       fn=eps;
   end
   if tp==0
       tp=eps;
   end
   if tn==0
       tn=eps;
   end
   mat(i,n+1)=tp;
   mat(i,n+2)=tn;
   mat(i,n+3)=fp;
   mat(i,n+4)=fn;
   cou=mat(i,n+10);
   mat(i,n+5)=(tp/(tp+fn))*cou;
   mat(i,n+6)=(tn/(fp+tn))*cou;
   mat(i,n+7)=(tp/(tp+fp))*cou;
   mat(i,n+8)=(fp/(fp+tn))*cou;
   mat(i,n+9)=((tp+tn)/(tp+fn+fp+tn))*cou;
end
[a,b]=size(label);
sen=(sum(mat(:,n+5)))/a;
spc=(sum(mat(:,n+6)))/a;
pre=(sum(mat(:,n+7)))/a;
acc=sum(diag(mat(1:m,1:n)))/a;
o1=sen;
o2=spc;
o3=pre;
o4=1-spc;
o5=acc;
end