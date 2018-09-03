function [ o1,o2,o3,o4,o5 ] = neuraltptn( teams,input,label,iteration,tp)
[m,n]=size(teams);
tp=tp/100;
    selection=zeros(1,n-3);
    i=1;
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
    mat=zeros(30,5);
    for i=1:30
        [ sen,spc,pre,acc,err,crr ] = neural_network(pssmtrain,label,iteration,tp,0);
        mat(i,1)=sen;
        mat(i,2)=spc;
        mat(i,3)=pre;
        mat(i,4)=0;
        mat(i,5)=acc;
    end
    s=sum(mat(1,:));
    k=1;
    for i=2:30
        if sum(mat(i,:))>s
            s=sum(mat(i,:));
            k=i;
        end
    end
    o1=mat(k,1);
    o2=mat(k,2);
    o3=mat(k,3);
    o4=1-mat(k,2);
    o5=mat(k,5);
end