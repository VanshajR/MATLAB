x=input('Enter x0: ');
y=input('Enter y0: ');
f=input('Enter function: ');
h=input('Enter step value: ');
r=input('Enter value at which y is required: ');
n = ceil((r-x)/h);
fprintf('Value at x%d=%f is y%d=%f:\n',0,x,0,y);
k1=h*f(x,y);
k2=h*f(x+(h/2),y+(k1/2));
k3=h*f(x+(h/2),y+(k2/2));
k4=h*f(x+h,y+k3);
y=y+(k1+2*k2+2*k3+k4)/6;
for i=1:n-1
    x=x+h;
    k1=h*f(x,y);
    k2=h*f(x+(h/2),y+(k1/2));
    k3=h*f(x+(h/2),y+(k2/2));
    k4=h*f(x+h,y+k3);
    fprintf('Value at x%d=%f is y%d=%f:\n',i,x,i,y);
    y=y+(k1+2*k2+2*k3+k4)/6;
end
