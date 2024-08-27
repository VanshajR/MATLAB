% Define the function
g = @(x) atan(4*x);

% Initial guess for the root
x0 = 0.2;  % You can choose a different initial guess if needed

% Tolerance for convergence
tolerance = 1e-3;

% Maximum number of iterations
maxIterations = 100;

% Initialize variables
x = x0;
iteration = 0;

% Perform fixed-point iterations
while abs(x - g(x)) > tolerance && iteration < maxIterations
    x = g(x);
    iteration = iteration + 1;
end

% Check if a root was found within the specified tolerance
if abs(x - g(x)) <= tolerance
    root1 = x;
    fprintf('Smallest positive root: %f\n', root1);
else
    fprintf('No convergence within the specified tolerance.\n');
end

% Now, let's find the second smallest positive root
% We'll start with a new initial guess
x0 = 0.2;  % Choose a different initial guess

% Reset variables
x = x0;
iteration = 0;

% Perform fixed-point iterations again
while abs(x - g(x)) > tolerance && iteration < maxIterations
    x = g(x);
    iteration = iteration + 1;
end

% Check if a root was found within the specified tolerance
if abs(x - g(x)) <= tolerance
    root2 = x;
    fprintf('Second smallest positive root: %f\n', root2);
else
    fprintf('No convergence for the second root within the specified tolerance.\n');
end
