% Numerical Analysis Review. Chapter 1 test
% Gwz, Shanghai University of Finance and Economics

clear;
clc;

m = 100;
n = 50;
ntest = 50;
algs = ["givens", "hhqr", "qrols"];
nalgs = length(algs);
res = zeros(ntest, nalgs);
tol = 1e-10;

for i = 1:ntest
    A = randn(m, n);
    b = A * rand(n, 1) + randn(m, 1);
    [Q1, R1] = givens(A);
    [Q2, R2] = hhqr(A);
    
    x = qrols(A, b);
    xols = (A'*A) \ (A' * b);
    
    if norm(A - Q1 * R1) < tol
        res(i, 1) = 1;
    end % End if
    
    if norm(A - Q2 * R2) < tol
        res(i, 2) = 1;
    end % End if
    
    if norm(x - xols) < tol
        res(i, 3) = 1;
    end % End if
    
end % End parfor

for i = 1:nalgs
    checkres(algs(i), res(:, i));
end % End for

if sum(sum(res)) == ntest * nalgs
    fprintf("\nAll algorithms PASSED.\n");
end % End if