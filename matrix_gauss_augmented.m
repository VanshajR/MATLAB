A=input('Enter matrix A: ');
b=input('Enter Matrix B: ');
n=length(b);
x=zeros(1,n);
detA=det(A);
if detA==0
    disp('Unsolvable');
    return;
end
a=[A b];
for i=1:n-1
    for j=i+1:n
        m=a(j,i)/a(i,i);
        a(j,:)= a(j,:)-m*a(i,:);
    end
end
disp(a)
x(n)=a(n,n+1)/a(n,n);
for k=n-1:-1:1
    x(k)=(a(k,n+1) - sum(a(k,k+1:n).*x(k+1:n)))/a(k,k);
end
disp(x)

