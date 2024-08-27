%%1. input
C=[3 5];
A=[1 2;1 1;0 1];
B=[2000;1500;600];

%%2. plotting
X1=0:1:max(B); %

%values of x2 from the 3 equations (all possible values, tabhi to line
%banegi, bahut saare points se)
x21=(B(1)-A(1,1).*X1)./A(1,2);
x22=(B(2)-A(2,1).*X1)./A(2,2);
x23=(B(3)-A(3,1).*X1)./A(3,2);

%make graph 1st quadrant only
x21=max(0,x21);
x22=max(0,x22);
x23=max(0,x23);

%plotting function
plot(X1,x21,'r',X1,x22,'b',X1,x23,'g')
xlabel('values of x1');
ylabel('values of x2');
title('x1|x2')

%%3. now finding corner points 

cx1=find(X1==0);

%for line 1
c1=find(x21==0);
line1=[X1(:,[c1 cx1]);x21(:,[c1 cx1])]'; %REMEMBER TRANSPOSE

%for line2
c2=find(x22==0);
line2=[X1(:,[c2 cx1]);x22(:,[c2 cx1])]';

%for line3
c3=find(x23==0);
line3=[X1(:,[c3 cx1]);x23(:,[c3 cx1])]';

corners=unique([line1; line2; line3],'rows');

%%4. get points of intersection

int=[0;0];
for i=1:size(A,1)
    a1=A(i,:);
    b1=B(i,:);
    for j=i+1:size(A,1)
        a2=A(j,:);
        b2=B(j,:);

        a_f=[a1;a2];
        b_f=[b1;b2];
        X=a_f\b_f;
        int=[int X];
    end
end
pt=int'; %%VERY IMP

%%5. all points
allpt=[pt;corners];
points=unique(allpt,'rows');

%%6. Feasible Region
fpt=constraint1(points);
fpt=unique(fpt,'rows');

%%7. Value of objective function
for i=1:size(fpt,1)
    Fx(i,:)=sum(fpt(i,:).*C);
end

%show points and their corresponding values 
tab=[fpt Fx];

%%8. Optimal value
[fxval,index]=max(Fx);   %min for minimise problem
optval=tab(index,:);
opt_BFS=array2table(optval);
opt_BFS.Properties.VariableNames={'x1','x2','Max Val'}

