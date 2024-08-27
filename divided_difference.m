p = [0 0.25 0.5 0.75]
f = [1 1.6487 2.7183 4.4817]
x = 0.43
n=4;
d=zeros(n,n);
for i=1:n
    d(i,1)=f(i);
end
for j = 2:n
    for i = 1:(n-j+1)
        d(i,j)=(d(i+1,j-1)-d(i,j-1))/(p(i+j-1)-p(i));
    end
end
disp(d)
a=1;
s=d(1,1);
for i=2:n
    a=a*(x-p(i-1));
    s=s+(a*d(i,1));
end
disp(s)

% i=2,j=2
% f[x0,x1] = f(x1) - f(x0)/ x1-x0
% D= f(x0) 1,1  f[x0,x1] 1,2    f[x0,x1,x2] 1,3    f[x0,x1,x2,x3] 1,4
%    f(x1) 2,1  f[x1,x2] 2,2    f[x1,x2,x3] 2,3
%    f(x2) 3,1  f[x2,x3] 3,2
%    f(x3) 4,1
% D(1,2)=D(2,1)-D(1,1)/p(2)-p(1)
% D(2,2)=D(3,1)-D(2,1)/p(3)-p(2)
% D(3,2)=D(4,1)-D(3,1)/p(4)-p(3)