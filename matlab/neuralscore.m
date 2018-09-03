function [ output ] = neuralscore( teams,input,label,iteration,tp,cr)
[m,n]=size(teams);
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
    
    [ sen,spc,pre,acc,err,crr ] = neural_network(pssmtrain,label,iteration,tp,cr);
    if cr==1
        teams(i,n-1)=err;
        teams(i,n)=crr;
    else 
        g=guidata(Selection);
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
end
output=teams;
end