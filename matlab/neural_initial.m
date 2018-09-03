function [ output ] = neural_initial( teams )
[m,n]=size(teams);
n=n-2;
for i=1:m
    for j=1:n
        k=randi(2);
        teams(i,j)=rand(1);
        if k==2
            teams(i,j)=-teams(i,j);
        end
    end
end
output=teams;
end

