% Numerical Analysis Review. Chapter 4 test
% Gwz, Shanghai University of Finance and Economics

clear;
clc;

n = 100;
ntest = 50;
algs = ["jacobi", "gs", "sor", "ssor"];
nalgs = length(algs);
res = zeros(ntest, nalgs);
w = 1.1;
maxiter = 100;
tol = 1e-10;

for i = 1:ntest
    
    A = rand(n, n) + eye(n) * 80;
    xtrue = randn(n, 1);
    b = A * xtrue;
    
    x = jacobi(A, b, maxiter, tol);
    if norm(A * x - b) / norm(b) < tol
        res(i, 1) = 1;
    end % End if
    
    x = gs(A, b, maxiter, tol);
    if norm(A * x - b) / norm(b) < tol
        res(i, 2) = 1;
    end % End if
    
    x = sor(A, b, w, maxiter, tol);
    if norm(A * x - b) / norm(b) < tol
        res(i, 3) = 1;
    end % End if
    
    x = ssor(A, b, w, maxiter, tol);
    if norm(A * x - b) / norm(b) < tol
        res(i, 4) = 1;
    end % End if
   
end % End parfor

for i = 1:nalgs
    checkres(algs(i), res(:, i));
end % End for

if sum(sum(res)) == ntest * nalgs
    fprintf("\nAll algorithms PASSED.\n");
end % End if