function out=constraint1(X)


%First constraint
x1=X(:,1);
x2=X(:,2);
cons1=x1+2.*x2-2000;
h1=find(cons1>0);
X(h1,:)=[];

%Second constraint
x1=X(:,1);
x2=X(:,2);
cons2=x1+x2-1500;
h2=find(cons2>0);
X(h2,:)=[];

%third constraint
x1=X(:,1);
x2=X(:,2);
cons3=0.*x1+x2-600;
h3=find(cons3>0);
X(h3,:)=[];

out=X;
end


