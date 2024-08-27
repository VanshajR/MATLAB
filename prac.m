x0=input('Enter guess 1: ');
x1=input('Enter guess 2: ');
e=input('Enter error: ');
i=1;
syms x;
func=input('Enter function: ');
f=inline(func,'x');
if f(x0)==f(x1)
    fprintf('Inapplicable');
    return;
end
x2 = x1 - ((x0-x1)/(f(x0)-f(x1)))*f(x1);
while abs(x1-x0)>e
    x0=x1;
    x1=x2;
    x2 = x1 - ((x0-x1)/(f(x0)-f(x1)))*f(x1);
    i=i+1;
end
fprintf('Root is %f\n',x2);
fprintf('Itertaions: %d\n',i);

