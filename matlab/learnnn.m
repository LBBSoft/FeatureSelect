function [ output ] = learnnn(mdl,input,label,iteration)
[a,b]=size(mdl);
not=10;
nog=5;
teams=zeros(not,b+2);
nos=iteration;
mtime=2;
teams=neural_initial(teams);
teams=neural_score(teams,input,label);
for i=1:nos
    teams=neural_grouping(teams,nog);
    teams=neural_groupmatch(teams,input,label,mtime);
end
teams=neural_eliminate(teams,input,label,mtime);
mdl=teams;
output=mdl;
end