% Numerical Analysis Review. Chapter 6 test
% Gwz, Shanghai University of Finance and Economics

clear;
clc;

n = 100;
ntest = 2;
algs = ["power", "invpower", "eigsqr", "hessqr"];
nalgs = length(algs);
res = zeros(ntest, nalgs);
maxiter = 100;
tol = 1e-10;

for i = 1:ntest
    
    A = rand(n);
    A = A' * A;
    
    eigvals = eig(A);
    
    lbdmax = eigpower(A, maxiter);
    lbdmin = eiginvpower(A, maxiter);
    
    if abs(lbdmax - max(abs(eigvals))) < tol
        res(i, 1) = 1;
    end % End if
    
    if abs(lbdmin - min(abs(eigvals))) < tol
        res(i, 2) = 1;
    end % End if
    
    [v, Q] = eigqr(A, 20);
    
    if norm(sort(v) - sort(eigvals)) / norm(A, "fro") < 1e-02
        res(i, 3) = 1;
    end % End if
    
    [v2] = eighessberg(A, 1000);
    
    if norm(sort(v2) - sort(eigvals)) / norm(A, "fro") < 1e-06
        res(i, 4) = 1;
    end % End if
    
end % End parfor

for i = 1:nalgs
    checkres(algs(i), res(:, i));
end % End for

if sum(sum(res)) == ntest * nalgs
    fprintf("\nAll algorithms PASSED.\n");
end % End if

v2 = sort(v2);
v = sort(v);
eigvals = sort(eigvals);