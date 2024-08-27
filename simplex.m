%SIMPLEX
%min z = x1 - 3x2 + 2x3
%Subject to
%3x1-x2+2x3<=7
%-2x1+4x2<=12
%4x1+3x2+8x3<=10
%max z = -x1+3x2-2x3

info = [3 -1 2;-2 4 0;-4 3 8];
C=[-1 3 -2];
b=[7;12;10];

NOVariables=size(info,2);
s=eye(size(info,1));
A=[info s b];
Cost=zeros(1,size(A,2));
Cost(1:NOVariables)=C;
BV=NOVariables+1:size(A,2)-1;
%For Zj-Cj
ZRow=Cost(BV)*A-Cost;
ZjCj=[ZRow;A];
simptable=array2table(ZjCj);
simptable.Properties.VariableNames(1:size(ZjCj,2))={'x1','x2','x3','s1','s2','s3','Solution'};
Run= true;
while Run
    if any(ZRow<0)
        fprintf('Current BFS is not optimal\n');
        fprintf('Next Iteration:\n');
        disp('Old BV:-')
        disp(BV)
        %Entering Variable
        ZC=ZRow(1:end-1);
        [Enter_col,Pivot_col]=min(ZC);
        fprintf('Most negative element in Z-row is %d coreesponiding to columb %d\n',Enter_col, Pivot_col);
        fprintf('Entering Variable is %d\n',Pivot_col);
        %Leaving Variable
        sol=A(:,end);
        Column=A(:,Pivot_col);
        if all(Column<=0)
            error('LPP has unbounded solution')
        else
            %ratio
            for i=1:size(Column,1)
                if Column(i)>0
                    ratio(i)=sol(i)./Column(i);
                else
                    ratio(i)=inf;
                end
            end
            %min ratio
            [Min_ratio,Pivot_row]=min(ratio);
            fprintf('Min ratio corresponding to pivot rows is %d\n',Pivot_row);
            fprintf('Leaving var is %d\n',BV(Pivot_row));
        end
        BV(Pivot_row)=Pivot_col;
        % disp(BV)

        %Pivot key
        Pivot_key=A(Pivot_row,Pivot_col);
        %Update table
        A(Pivot_row,:)=A(Pivot_row,:)./Pivot_key;
        for i=1:size(A,1)
            if i~=Pivot_row
                A(i,:)=A(i,:)-A(i,Pivot_col).*A(Pivot_row,:);
            end
            ZRow = Cost(BV) * A - Cost;
            ZRow=ZRow(Pivot_col).*A(Pivot_row,:);
            %Print Updated Table
            ZjCj=[ZRow;A];
            simptable=array2table(ZjCj);
            simptable.Properties.VariableNames(1:size(ZjCj,2))={'x1','x2','x3','s1','s2','s3','Solution'}
            BFS=zeros(1,size(A,2));
            BFS(BV)=A(:,end);
            BFS(end)=sum(BFS.*Cost);
            CurrentBFS=array2table(BFS);
            CurrentBFS.Properties.VariableNames(1:size(CurrentBFS,2))={'x1','x2','x3','s1','s2','s3','Solution'}
        end
    else 
        Run=false;
        fprintf('Optimality Reached\n');
    end
end