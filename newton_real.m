clear all;
x0=input('Enter initial guess: ');
e=input('Enter error margin: ');
syms x;
func=input('Enter function: ');
f=inline(func,'x');
d=diff(sym(func));
df=inline(d,'x');
x1 = x0-(f(x0)/df(x0));
i=1;
if abs(df(x0))==0
    fprintf('Newton Raphson method is inapplicable\n');
    return;
end

    while abs(x1-x0)>e
        %temp=x1;
        x0=x1;
        x1=x0-(f(x0)/df(x0));
        i=i+1;
    end

%fprintf('The second last root is: %f\n',temp);
fprintf('The root is: %f\n',x0);
fprintf('No of ierations is %d\n',i);