function out = constraint(X)
    x1=X(:,1);
    x2=X(:,2);
    cons1=3*x1+5*x2-15;
    h1=find(cons1>0);  %<0 if inequality <0
    X(h1,:)=[];

    x1=X(:,1);
    x2=X(:,2);
    cons2=5*x1+2*x2-10;
    h2=find(cons2>0);
    X(h2,:)=[];
    out=X;
end
