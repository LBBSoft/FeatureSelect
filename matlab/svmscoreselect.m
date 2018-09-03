function [ sen,spc,pre,acc] = svmscoreselect(label,p)
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
   mat(i,n+5)=(tp/(tp+fn))*mat(i,n+10);
   mat(i,n+6)=(tn/(fp+tn))*mat(i,n+10);
   mat(i,n+7)=(tp/(tp+fp))*mat(i,n+10);
   mat(i,n+8)=(fp/(fp+tn))*mat(i,n+10);
   mat(i,n+9)=((tp+tn)/(tp+fn+fp+tn))*mat(i,n+10);
end
[a,b]=size(label);
sen=(sum(mat(:,n+5)))/a;
spc=(sum(mat(:,n+6)))/a;
pre=(sum(mat(:,n+7)))/a;
acc=sum(diag(mat(1:m,1:n)))/a;
end

