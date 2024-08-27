f=input('Enter f(x): ');
%f=@(x)sin(x);
a=input('Enter lower limit: ');
b=input('Enter upper limit: ');
n=input('Enter number of intervals: ');
h=(b-a)/n;
sum=0;
for i=1:n-1
    x=a+(h*i);
    if rem(i,2)==0
        sum=sum+(2*f(x));
    else
        sum=sum+(4*f(x));
    end
end
sum=sum+f(a)+f(b);
res=sum*(h/3);
fprintf('Final result: %f\n',res);