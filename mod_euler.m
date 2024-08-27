x=input('Enter x0: ');
y=input('Enter y0: ');
f=input('Enter function: ');
h=input('Enter step value: ');
r=input('Enter value at which y is required: ');
n=ceil((r-x)/h);
fprintf('Value at x%d=%f is y%d=%.5f:\n',0,x,0,y);
prev_x=x;
sy=y+h*f(x,y);
x=x+h;
y=y+(h/2)*(f(prev_x,y)+f(x,sy));
for i=1:n
    fprintf('Value at x%d=%f is y%d=%.5f:\n',i,x,i,y);
    sy=y+h*f(x,y);
    x=x+h;
    y=y+(h/2)*(f(prev_x,y)+f(x,sy));
    prev_x=x;
end

ru