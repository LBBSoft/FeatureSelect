function [ sen,spc,prc,acc,err,crr ] = neural_network( input,label,iteration,tp,cr )
ma=max(label);
mi=min(label);
main_label=label;
[m,n]=size(label);
for i=1:m
    label(i,1)=(label(i,1)-mi)/(ma-mi);
end
train=input;
trainl=label;
test=[];
testl=[];
main_tl=[];
[m,n]=size(train);
for i=1:round((1-tp)*m)
    [a,b]=size(train);
    k=randi(a);
    test=[test;train(k,:)];
    testl=[testl;trainl(k,1)];
    main_tl=[main_tl;main_label(k,1)];
    train(k,:)=[];
    trainl(k,:)=[];
    main_label(k,:)=[];
end
mdl=createnn(train,trainl,iteration);
tl=scorelabel(mdl,test,testl);
target=testl;
pre=tl;
[a,b]=size(pre);
for i=1:a
    x1=abs(pre(i,1)-target(1,1));
    k=1;
    for j=2:a
        if (abs(pre(i,1)-target(j,1))<x1) 
            x1=abs(pre(i,1)-target(j,1));
            k=j;
        end
    end
    pre(i,1)=main_label(k,1);
end
o1=0;
o2=0;
o3=0;
o4=0;
if cr==0
    [o1,o2,o3,o4]=svmscoreselect(main_tl,pre);
end
sen=o1;
spc=o2;
prc=o3;
acc=o4;
[m,n]=size(mdl);
err=mdl(m,n);
disp(['The value of error is : ',num2str(err)]);
crr=corr2(target,pre);
end