c=[1,2,-1];
a=[1 -2 -3;2 3 -4;1 1 1];
b=[4;5;2];

%inequalities, 0 for <=, 1 for >=
Ineqsign=[0 1 1];

%introduce slack and surplus
s=eye(size(a,1));
index=find(Ineqsign>0);
s(index,:)=-s(index,:);

%to write standard form
objfn=array2table(c);
objfn.Properties.VariableNames(1:size(c,2))={'x_1','x_2','x_3'};
objfn;
mat=[a s b];
cons=array2table(mat);
cons.Properties.VariableNames(1:size(mat,2))={'x_1','x_2','x_3','s1','s2','s3','b'};
cons;
