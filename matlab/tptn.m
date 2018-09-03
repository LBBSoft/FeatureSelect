function [ o1,o2,o3,o4,o5 ] = tptn(teams,input,tp,label,sv,ct,iteration)
if ct==1
   [a1,a2,a3,a4,a5]=svmtptn(teams,input,tp,label,sv);
end
if ct==2
   [a1,a2,a3,a4,a5]=neuraltptn(teams,input,label,iteration,tp);
end
if ct==3
   [a1,a2,a3,a4,a5]=decisiontptn(teams,input,tp,label);
end
o1=a1;
o2=a2;
o3=a3;
o4=a4;
o5=a5;
end