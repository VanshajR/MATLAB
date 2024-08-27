clear all;
x0=input('Enter initial guess: ');
%e=input('Enter error margin: ');
e=1e-5;
%func=input('Enter function: ');
f=@(x)4*(x^2)-exp(x)-exp(-x);
syms x;
df(x)=diff(f(x));


x1 = x0 -( f(x0) / df(x0) );
disp(x1)
i=1;
if abs(df(x0))==1
    fprintf('Newton is inapplicable');
    return;
else
    while abs(x1-x0)>e
        temp=x1;
        x0=x1;
        x1 = x0 - ( f(x0) / df(x0) );
        i=i+1;
    end
end
fprintf('The second last root is: %f\n',temp);
fprintf('The root is: %f\n',x0);
fprintf('No of ierations is %d\n',i);