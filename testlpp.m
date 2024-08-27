clc
clear all

% Coefficients of the objective function
C = [-1, 2, -1, 0, 0, 0, 0];

% Coefficients of the constraints (equality form with slack variables)
A = [1, 0, 0, 1, 0, 0, 0;
     0, 1, 0, 0, 1, 0, 0;
    -1, 1, 0, 0, 0, 1, 0;
    -1, 0, 2, 0, 0, 0, 1];

% Right-hand side of the constraints
B = [4; 4; 6; 4];

n = size(A, 2);
m = size(A, 1);

if (n < m)
    error("Invalid");
end

ncm = nchoosek(n, m);
pairs = nchoosek(1:n, m);

sol = [];
values = [];

for i = 1:ncm
    y = zeros(n, 1);
    x = A(:, pairs(i, :)) \ B;
    if all(x >= 0 & x ~= inf & x ~= -inf)
        y(pairs(i, :)) = x;
        sol = [sol y];
        values = [values, C * y];
    end
end

% Display all basic feasible solutions and their values
all_BFS = [sol; values];
all_BFS_table = array2table(all_BFS', 'VariableNames', {'x1', 'x2', 'x3', 's1', 's2', 's3', 's4', 'Value'});
disp(all_BFS_table);
