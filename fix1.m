x0=input('Enter initial guess: ');
e=input('Enter error margin: ');
syms x;
func=input('Enter function: ');
f=inline(func,'x');
df(x)=diff(f(x));
x1=0;
if abs(df(x0))>1
    fprintf('Wrong choice for g(x)');
else
    for i=1:100
    x1=f(x0);
    temp=x1;
    if abs(x1-x0)<e
        break
    end
    x0=x1;
    end
end
fprintf('The second last root is: %.5f\n',temp);
fprintf('The root is: %.5f\n',x0);
fprintf('No of ierations is %d\n',i);