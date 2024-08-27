clc
clear all
%I
C=[3 5];
A=[1 2;1 1;0 1];
B=[2000;1500;600];

X1=0:1:max(B);

x21=(B(1)-A(1,1).*X1)/A(1,2);
x22=(B(2)-A(2,1).*X1)/A(2,2);
x23=(B(3)-A(3,1).*X1)/A(3,2);

x21=max(0,x21);
x22=max(0,x22);
x23=max(0,x23);

plot(X1,x21,'r',X1,x22,'g',X1,x23,'b');
xlabel('Values of x2');
ylabel('Values of x1');
title('X1 vs X2');

cx1=find(X1==0);

c1=find(x21==0);
line1=[X1(:,[c1 cx1]);x21(:,[c1 cx1])]';

c2=find(x22==0);
line2=[X1(:,[c2 cx1]);x22(:,[c2 cx1])]';

c3=find(x23==0);
line3=[X1(:,[c3 cx1]);x23(:,[c3 cx1])]';

corners=unique([line1;line2;line3],'rows');

int=[0;0];
for i=1:size(A,1)
    a1=A(i,:);
    b1=B(i,:);
    for j=i+1:size(A,1)
        a2=A(j,:);
        b2=B(j,:);
        
        a_f=[a1;a2];
        b_f=[b1;b2];

        x=a_f\b_f;
        int =[int x];
    end
end
pt=int';

allpt=[pt;corners];
points=unique(allpt,'rows');

fpt=constraints(points);
fpt=unique(fpt,'rows');

for i=1:size(fpt,1)
    Fx(i,:)=sum(fpt(i,:).*C);
end
tab=[fpt Fx];
[fxval,index]=max(Fx);
optval=tab(index,:);
final=array2table(optval);
final.Properties.VariableNames={'x1','x2','Value'}