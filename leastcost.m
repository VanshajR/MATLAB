% Input
Cost=[2 7 4;3 3 1; 5 5 4;1 6 2];
A=[5 8 7 14];
B=[7 9 18];
if sum(A)==sum(B)
    fprintf('Balanced');
else
    fprintf('Unbalanced');
    if sum(A)<sum(B)
        Cost(end+1,:)=zeros(1,size(B,2));
    elseif sum(A)>sum(B)
        Cost(:,end+1)=zeros(1,size(A,1));
        B(end+1)=sum(A)-sum(B);
    end
end
ICost=Cost;
X=zeros(size(Cost));    %initialise allocation
[m,n]=size(Cost);       %no of rows and cols
BFS=m+n-1;              %total no of BFS

%Find cell
for i=1:size(Cost,1)
    for j=1:size(Cost,2)
        lc=min(Cost(:));  %find min cost
        [Row_index,Col_index]=find(lc==Cost); %find position of least cost cell
        x11=min(A(Row_index),B(Col_index));
        [val,index]=max(x11); %find max allocation
        ii=Row_index(index);  %get row position
        jj=Col_index(index);  %get col position
        y11=min(A(ii),B(jj)); %find the value
        X(ii,jj)=y11;
        A(ii)=A(ii)-y11;
        B(jj)=B(jj)-y11;
        Cost(ii,jj)=Inf;
    end
end
IBFS=array2table(X);
disp(IBFS)
fprintf('Initial BFS=\n');

TotalBFS=length(nonzeros(X));
if TotalBFS==BFS
    fprintf('IBFS is Non degenerate\n');
else
    fprintf('IBFS is degenerate\n');
end


InitialCost=sum(sum(ICost.*X));
fprintf('Assignments:\n');
disp(X);
fprintf('Initial BFS Cost is %d\n',InitialCost);
