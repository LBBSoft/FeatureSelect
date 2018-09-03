function [ o1,o2] = filter_err(teams,input,tp,label,sv,ct,iteration)
if ct==1
   [a1,a2]=svmerr(teams,input,tp,label,sv);
end
if ct==2
   [a1,a2]=neuralerr(teams,input,label,iteration,tp);
end
if ct==3
   [a1,a2]=decisionerr(teams,input,tp,label);
end
o1=a1;
o2=a2;
end