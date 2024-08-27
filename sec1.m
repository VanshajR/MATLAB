f=@(x)x-2*sin(x);
g=@(x)1-2*cos(x);
x0=input('Enter x0');
x1 = x0 - (f(x0)/g(x0))