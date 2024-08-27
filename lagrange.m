p=[0 0.25 0.5 0.75];
f=[1 1.64872 2.71828 4.48169];
x=0.43;
sum=0;
n=4;
l=ones(n,1);
for i = 1:n
    for j=1:n
        if(j~=i)
            l(i)=l(i)*(x-p(j))/(p(i)-p(j));
        end
    end
    sum=sum+(l(i)*f(i));
end
fprintf("The sum is: %f\n",sum);