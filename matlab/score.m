function [ output ] = score( teams,input,label,tp,sv)
g=guidata(Selection);
ct=get(g.popupmenu2,'value');
cr=get(g.checkbox25,'value');
iteration=get(g.edit79,'string');
iteration=str2num(iteration);
if ct==1
   teams=svmscore(teams,input,label,tp,sv);
end
if ct==2
   teams=neuralscore(teams,input,label,iteration,tp,cr);
end
if ct==3
   teams=decisionscore( teams,input,label,tp);
end
output=teams;
end