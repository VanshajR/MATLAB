clear all;
x0=input('Enter initial guess 1: ');
x1=input('Enter initial guess 2: ');
e=input('Enter error margin: ');
syms x;
func=input('Enter function: ');
f=inline(func,'x');
x2 = x1 - ((x1-x0)/(f(x1)-f(x0)))*f(x1);
i=1;
if f(x0)==f(x1)
    fprintf('Secant is inapplicable');
    return;
end
    while abs(x2-x1)>e
        temp=x1;
        x0=x1;
        x1=x2;
        x2 = x1 - (x1-x0) / (f(x1)-f(x0)) * f(x1);
        i=i+1; 
    end
fprintf('The second last root is: %f\n',temp);
fprintf('The root is: %f\n',x0);
fprintf('No of iterations is %d\n',i);