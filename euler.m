x=input('Enter x0: ');
y=input('Enter y0: ');
f=input('Enter function: ');
h=input('Enter step value: ');
r=input('Enter value at which y is required: ');
n=r/h;
fprintf('Value at x%d=%f is y%d=%f:\n',0,x,0,y);
y=y+h*f(x,y);
for i=1:n
    x=x+h;
    fprintf('Value at x%d=%f is y%d=%f:\n',i,x,i,y);
    y=y+h*f(x,y);
end


    

