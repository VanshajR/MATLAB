A=[1 1 0;0 -1 1];
b=[1;0];
c=[1 1 1];
n=size(A,2);
m=size(A,1);

if n>m
    ncm=nchoosek(n,m); %Total number of basic solutions
else
    error('No solution');
end
p=nchoosek(1:n,m); %pairs of basic solution
disp(p)
s=[]; %default solutions is zero
for i=1:ncm
    y=zeros(n,1);
    a1=A(:,p(i,:));
    x=inv(a1)*b;
    %check feasibility
    if all(x>=0 & x~=inf & x~=-inf)
        y(p(i,:))=x;
        s=[s y];
    end
end
z=c*s;
%disp(s)
%disp(x)
[obj,index]=max(z);
BFS=s(:,index)
optval=[BFS' obj]