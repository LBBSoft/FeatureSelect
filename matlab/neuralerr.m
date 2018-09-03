function [ o1,o2 ] = neuralerr( teams,input,label,iteration,tp)
[m,n]=size(teams);
tp=tp/100;
iteration=iteration*30;
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
    [ sen,spc,pre,acc,err,crr ] = neural_network(pssmtrain,label,iteration,tp,0);
    o1=err;
    o2=crr;
end