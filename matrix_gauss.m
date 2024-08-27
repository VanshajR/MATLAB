clear;
a=input('Enter matrix A: ');
n=length(a);
b=input('Enter Matrix B: ');
detA=det(a);
if detA==0
    disp('Unsolvable');
    return;
end
l=zeros(n,n);
u=zeros(n,n);
for i=1:n
    l(i,i)=1;
end
u(1,:)=a(1,:);
l(:,1)=a(:,1)/u(1,1);
for i=2:n
    for j=i:n
        u(i,j)=a(i,j)-l(i,1:i-1)*u(1:i-1,j);
    end
    for k=i+1:n
        l(k,i)=(a(k,i)- l(k,1:i-1)*u(1:i-1,i))/u(i,i);
    end
end

fprintf("Lower Matrix:\n");
disp(l);
fprintf("Upper Matrix:\n");
disp(u);
y=zeros(n,1);
y(1)=b(1)/l(1,1);
for k=2:n
    y(k)=b(k)-l(k,1:k-1)*y(1:k-1);
end
disp(y);
x=zeros(n,1);
x(n)=y(n)/u(n,n);
for k=n-1:-1:1
    x(k)=(y(k)-u(k,k+1:n)*x(k+1:n))/u(k,k);
end
disp('Final Answer:')
disp(x)


