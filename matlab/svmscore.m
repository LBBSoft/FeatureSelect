function [ output ] = svmscore( teams,input,label,tp,sv)
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
    model = svmtrain(label(1:fix(a*tp),1),pssmtrain(1:fix(a*tp),:),sv);
    if ~contains(sv,'-v')
    [p, accuracy_L,d] = svmpredict(label(fix(a*tp):a,1), pssmtrain(fix(a*tp):a,:), model);
    if cr==1
        teams(i,n-1)=accuracy_L(2);
        teams(i,n)=accuracy_L(3);
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
        teams(i,n)=accuracy_L(2);
    end
    else
       teams(i,n-1)=-model;
       teams(i,n)=0;
    end
end
output=teams;
end