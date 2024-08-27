function out=constraints(X)

x1=X(:,1);
x2=X(:,2);
cons1=x1+2.*x2-2000;
h1=find(cons1>0);
X(h1,:)=[];


x1=X(:,1);
x2=X(:,2);
cons2=x1+x2-1500;
h2=find(cons2>0);
X(h2,:)=[];

x1=X(:,1);
x2=X(:,2);
cons3=x2-600;
h3=find(cons3>0);
X(h3,:)=[];

out=X;
end

