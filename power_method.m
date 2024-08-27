A=input('Enter matrix: ');
N=length(A);
err=input('Enter error margin: ');
x=ones(N,1);
y=A*x;
k=max(abs(y));
x=y/k;
y=A*x;
if(abs(k-max(abs(y)))<err)
    fprintf("Eigen value is: %f\n",k);
    fprintf("Eigen vector is:\n");
    disp(x);
else
    while(abs(k-max(abs(y)))>err)
        k=max(abs(y));
        x=y/k;
        y=A*x;
    end
    fprintf("Eigen Value is: %f\n",k);
    fprintf("Eigen Vector is:\n");
    disp(y/k);
end
