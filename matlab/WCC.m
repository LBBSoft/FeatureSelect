clc
load 'input.txt';
input(1,:)=[];
input(:,1)=[];
[m,n]=size(input);
nteam=10;
col=round(m/5);
nos=10;
teams=zeros(nteam,col+2);
mtime=9;
teams=initial(teams);
nog=round(nteam/4);
nogr=nteam/4;
label=input(:,n);
val=zeros(1,nos);
teams=score(teams,input,label);
for g=1:nos
   teams=grouping(teams,nogr,nteam); 
   teams=groupmatch(teams,mtime,input,label);
   val(1,g)=max(teams(:,col+2));
end
teams
teams=eliminate(teams,mtime,input,label)