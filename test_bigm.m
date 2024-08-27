clc
clear all
format short
% Matlab Code of Big M Method
% solve the following LPP
% Minimize z=2x1+x2
% Subject to 3x1+x2=3
% 4x1+3x2>=6
% x1+2x2<=3
% x1,x2>=0
% Convert Minimization Problem into Maximization Problem
% Maximize Z=-2x1-x2
% Phase I: Information Phase
Variables={'x_1','x_2','s_2','s_3','A_1','A_2','Sol'};
M=1000;
Cost=[-2,-1,0,0,-M,-M,0];      %cost of the LPP
A=[3, 1, 0, 0, 1, 0, 3;4, 3, -1, 0, 0, 1, 6;1, 2, 0, 1, 0, 0, 3];  %Constraints
s=eye(size(A,1));
%% To find the starting BFS
BV=[];
for j=1:size(s,2)
    for i=1:size(A,2)
        if A(:,i)==s(:,j)
            BV=[BV i];
        end
    end
end
%% To compute Z-Row(zj-cj)
ZjCj=Cost(BV)*A-Cost;
%% To print the table
ZCj=[ZjCj;A];
SimpTable=array2table(ZCj);
SimpTable.Properties.VariableNames(1:size(ZCj,2))=Variables;
%% Simplex Table starts
Run=true;
while Run
    ZC=ZjCj(:,1:end-1);
if any(ZC<0) %To check any negative value is there
    fprintf('The current BFS is not Optimal \n')
    fprintf('\n ============The Next Iteration Results========\n')
    %To find the entering variable
    [Entval,Pvt_Col]=min(ZC);
    fprintf('Entering Column is %d \n', Pvt_Col)
    %To find the leaving variable
    sol=A(:,end);
    Column=A(:,Pvt_Col);
    if all(Column<=0)
       fprintf('LPP has unbounded solution')
   else
    %To check minimum ration is with positive entering column entries
   for i=1:size(Column,1)
        if Column(i)>0
    ratio(i)=sol(i)./Column(i);
        else
            ratio(i)=inf;
        end
 end
    %To Finding the minimum Ratio
    [MinRatio, Pvt_Row]=min(ratio);
    fprintf('Leaving Row is %d \n', Pvt_Row)
    end
BV(Pvt_Row)=Pvt_Col;
     %Pivot Key
    Pvt_Key=A(Pvt_Row,Pvt_Col);
    %Update the Table for next Iteration
    A(Pvt_Row,:)=A(Pvt_Row,:)./Pvt_Key;
    for i=1:size(A,1)
        if i~=Pvt_Row
            A(i,:)=A(i,:)-A(i,Pvt_Col).*A(Pvt_Row,:);
        end
        ZjCj=ZjCj-ZjCj(Pvt_Col).*A(Pvt_Row,:);
         %To print the table
ZCj=[ZjCj;A];
SimpTable=array2table(ZCj);
SimpTable.Properties.VariableNames(1:size(ZCj,2))=Variables
    end  
else
    Run=false;
    fprintf('======********============\n')
    fprintf('The current BFS is optimal and Optimality is reached \n')
    fprintf('======********============\n')
end
end
BFS=zeros(1,size(A,2));
BFS(BV)=A(:,end);
BFS(end)=sum(BFS.*Cost);
CurrentBFS=array2table(BFS);
CurrentBFS.Properties.VariableNames(1:size(CurrentBFS,2))=Variables