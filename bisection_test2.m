clear;
%clc;
a=input('Enter lower limit: ');
b=input('Enter upper limit: ');
e=input('Enter error margin: ');
f=input('Enter function: ');
%c=(a+b)/2;
i=0;
if f(a)*f(b)>0
        fprintf('Root is not in given range');
        return;
else
    while abs(a-b)>e
        c=(a+b)/2;
    if f(a)*f(c)<0
        b=c;
    else 
        a=c;
    end
    
    i=i+1;
    end
end
fprintf('The root is at: %f\n',c);
fprintf('Number of iterations: %d\n',i);
