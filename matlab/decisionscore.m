function [ output ] = decisionscore( teams,input,label,tp)
[m,n]=size(teams);
[a,b]=size(input);
g=guidata(Selection);
cr=get(g.checkbox25,'value');
for i=1:m
    selection=zeros(1,n-3);
    for j=1:n-3
        flag=1;
        for k=1:j-1
            if teams(i,k)==teams(i,j)
                flag=0;
                break;
            end
        end
        if flag==1
            selection(1,j)=teams(i,j);
        end
    end
   
    pssmtrain=[];
    for j=1:n-3
        if selection(1,j)~=0
           pssmtrain=[pssmtrain,input(:,teams(i,j))]; 
        end
    end
    model = fitrtree(pssmtrain(1:fix(a*tp),:),label(1:fix(a*tp),1));
    p = predict(model,pssmtrain(fix(a*tp):a,:));
    crr=corr2(label(fix(a*tp):a,1),p);
    err=p-label(fix(a*tp):a,1);
    err=power(err,2);
    err=sum(err);
    i1=length(p);
    err=err/i1;
    err=sqrt(err);
    if cr==1
        teams(i,n-1)=err;
        teams(i,n)=crr;
    else 
        [sen,spc,pre,acc]=svmscoreselect(label(fix(a*tp):a,1),p);
        ct=get(g.popupmenu3,'value');
        teams(i,n-1)=-acc;
        if ct==3
           teams(i,n-1)=-sen;
        end
        if ct==4
           teams(i,n-1)=-spc;
        end
        if ct==5
           teams(i,n-1)=-pre;
        end
        teams(i,n)=err;
    end
    disp(['The value of score is: ',num2str(teams(i,n-1))]);
end
output=teams;
end