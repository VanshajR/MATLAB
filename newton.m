clear;
clc;
value_x0="Enter x0: ";
x_right=input(value_x0);
err="Enter allowed error: ";
e=input(err);
%fun = "Enter the function: ";
%f=str2func(['@x','fun','(x)']);
f=@(x)x^2-2;
%g=diff(f);
g=@(x) 2*x;
x_left=0;
i=0;
while(abs(i-x_left)>e)
    i=x_right;
    x_left=x_right - (f(x_right)/g(x_right));
    x_right=x_left;
end
disp(x_left)

