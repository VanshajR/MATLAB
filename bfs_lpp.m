clc
clear all
%I nput
C=[-1 2 -1 0 0 0 0];
A=[1 0 0 1 0 0 0;
    0 1 0 0 1 0 0;
    -1 1 0 0 0 1 0;
    -1 0 2 0 0 0 1];
B=[4;4;6;4];

n=size(A,2);
m=size(A,1);

if(n<m)
    error("Invalid");
end

ncm=nchoosek(n,m);
pairs=nchoosek(1:n,m);

sol=[];
vals=[];
for i=1:ncm
    y=zeros(n,1);
    x=A(:,pairs(i,:))\B;
    if all(x>=0&x~=inf&x~=-inf)
        y(pairs(i,:))=x;
        sol=[sol y];
        vals=[vals,C*y];
    end
end
all_BFS=[sol;vals];
all_BFS_table = array2table(all_BFS', 'VariableNames', {'x1', 'x2', 'x3', 's1', 's2', 's3', 's4', 'Value'});
disp(all_BFS_table);
z=C*sol;
[maxval,index]=max(z);
bfs=sol(:,index);
optval=[bfs' maxval];
opt_BFS=array2table(optval);
opt_BFS.Properties.VariableNames={'x1','x2','x3','s1','s2','s3','s4','Value'}