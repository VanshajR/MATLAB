%% Min f = x1^2-x1*x2+x2^2
clc
clear all
%Input parameters
x0 = [1;0.5]; %Initial point
lambda = 0.01; %optimal step length
tol = 0.005; %tolerance
itr = 0;
f = @(x) x(1)^2-x(1)*x(2)+x(2)^2;
grad_f = @(x) [2*x(1)-x(2); -x(1)+2*x(2)];
gradient= grad_f(x0)
while(norm(gradient)>tol)
    x = x0 - lambda*gradient;
    x0 = x;
    gradient = grad_f(x0);
    itr = itr+1;
end
min_pt = x
fun_value = f(min_pt)