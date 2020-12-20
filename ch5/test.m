% Numerical Analysis Review. Chapter 5 test
% Gwz, Shanghai University of Finance and Economics

clear;
clc;

n = 100;
ntest = 50;
algs = ["steepdct", "cg"];
nalgs = length(algs);
res = zeros(ntest, nalgs);
maxiter = 100;
tol = 1e-10;

for i = 1:ntest
    
    % Matlab in-planted function cgs.
    xtrue = randn(n, 1);
    A = eye(n) + xtrue * xtrue';
    b = A * xtrue;
    x = steepdct(A, b, maxiter, tol);
    
    if norm(A * x - b) / norm(b) < tol
        res(i, 1) = 1;
    end % End if
    
    x = cg(A, b, maxiter, tol);
    
    if norm(A * x - b) / norm(b) < tol
        res(i, 2) = 1;
    end % End if
  
end % End parfor

    
for i = 1:nalgs
    checkres(algs(i), res(:, i));
end % End for

if sum(sum(res)) == ntest * nalgs
    fprintf("\nAll algorithms PASSED.\n");
end % End if
