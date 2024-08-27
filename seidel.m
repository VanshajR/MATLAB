clear;
A=input('Enter matrix A: ');
B=input('Enter matrix B: ');
P=input('Enter initial guess matrix: ');
e=input('Enter error margin: ');
N=length(B);
n=input('Enter no of iterations: ');
X=zeros(N,1);
Y=zeros(N,1);
for j=1:n
    for i=1:N
        X(i)=(B(i)/A(i,i))-(A(i,[1:i-1,i+1:N])*P([1:i-1,i+1:N]))/A(i,i);
        P(i)=X(i);
    end
    fprintf("Iteration: %d\n",j)
    disp(X)
    if(abs(Y-X))<e
        break
    end
    Y=X;
end
disp(Y);
