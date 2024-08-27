%f=input('Enter f(x): ');
f=@(x)sin(x);
a=input('Enter lower limit: ');
b=input('Enter upper limit: ');
n=input('Enter number of intervals: ');
h=(b-a)/n;
sum=0;
for i=1:n-1
    x=a+(h*i);
    sum=sum+(2*f(x));
end
res=(h/2)*(f(a)+f(b)+sum);
fprintf('Final result: %f\n',res);