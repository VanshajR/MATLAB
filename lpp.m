c=[5 3];
a=[3 5;5 2];
b=[15;10];
x=0:1:max(b);
y=0:1:max(b);
y1=(15-a(1,1)*x)/a(1,2);
y2=(10-a(2,1)*x)/a(2,2);
y1=max(0,y1);
y2=max(0,y2);
plot(x,y1,'r',x,y2,'b');
title('matplotlib jaisa');
xlabel('ye hai X');
ylabel('ye hai Y');
py1=find(y1==0);
py2=find(y2==0);
px=find(x==0);
line1=[x(:,[py1 px]);y1(:,[py1 px])]'  %get points as (y1,x) where x=0
line2=[x(:,[py2 px]);y2(:,[py2 px])]'  %get points as (y2,x) where x=0
corner=unique([line1;line2],'rows')    %get distinct points common in line 1 and 2

pt=[0;0];
for i=1 : size(a,1)
    a1=a(i,:);
    b1=b(i,:);
    for j = i+1:size(a,1)
        a2=a(j,:);
        b2=b(j,:);
        a4=[a1;a2];
        b4=[b1;b2];

        x=inv(a4)*b4;
        pt=[pt x]; %get all points
    end
end

ptt=pt'

%all corner points
allpt=[ptt;corner]
points=unique(allpt,"rows")

%corner points in Fr
PT=constraint(points)
P=unique(PT,"rows")
%objective function
FX=sum(P.*c,2)
Vert_Fns=[P,FX]

%optimal value
[fxval,indfx]=max(FX);
optval=Vert_Fns(indfx,:)
OPTIMAL_BFS=array2table(optval,'VariableNames',{'x1','x2','ObjectiveFunctionValue'})