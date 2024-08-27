clear all;
x0=input('Enter initial guess: ');
e=input('Enter error margin: ');
syms x;
func=input('Enter function: ');
f=inline(func,'x');
df(x)=diff(f(x));
m=f(x0)/df(x0)
x1 = x0-m;
i=1;
disp(f(x))
disp(df(x))
disp(x1)
disp(f(x0))
disp(df(x0))
