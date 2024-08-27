x0=input('Enter initial guess: ');
e=input('Enter error margin: ');
syms x;
func=input('Enter function: ');
f=inline(func,'x');
d=diff(sym(func));  
df=inline(d,'x');
x1=f(x0);
if abs(df(x0))>1
    fprintf('Wrong choice for g(x)\n');
    return;
end
    for i=1:100
    temp=x1;
    if abs(x1-x0)<e
        break
    end
    x0=x1;
    x1=f(x0);
    
    end
i=i+1;
fprintf('The second smallest root is: %.5f\n',temp);
fprintf('The root is: %.5f\n',x0);
fprintf('No of ierations is %d\n',i);

