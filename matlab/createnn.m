function [ output ] = createnn( input,label,iteration)
[m,n]=size(input);
nen=n;
k=nen;
layer=nen;
while k>1
    k=fix(k/2);
    layer=[layer,k];
end
k=n*n+n;
[a,b]=size(layer);
for i=2:b
    k=k+layer(i)*layer(i-1)+layer(i);
end
mdl=zeros(1,k);
mdl=learnnn(mdl,input,label,iteration);
output=mdl;
end