% Numerical Analysis Review. Chapter 1 test
% Gwz, Shanghai University of Finance and Economics

clear;
clc;

n = 100;
ntest = 50;
algs = ["lsolve", "usolve", "ludcp", "choldcp", "ldldcp"];
nalgs = length(algs);
res = zeros(ntest, nalgs);
tol = 1e-10;

for i = 1:ntest
    
    A = rand(n, n) + eye(n);
    xtrue = rand(n, 1);
    Asym = eye(n) + xtrue * xtrue';
    L = tril(A);
    U = triu(A);
    b = L * xtrue;
    lx = lsolve(L, b);
    ux = usolve(U, b);
    
    if norm(L * lx - b) < tol
        res(i, 1) = 1;
    end % End if
    
    if norm(U * ux - b) < tol
        res(i, 2) = 1;
    end % End if
    
    [L, U, p] = ludcp(A, 1); 
    
    if norm(A(p, :) - L * U) < tol
        res(i, 3) = 1;
    end % End if 
    
    L = choldcp(Asym);
    
    if norm(Asym - L * L') < tol
        res(i, 4) = 1;
    end % End if
    
    [L, d] = ldldcp(Asym);
    if norm(Asym - L * diag(d) * L') < tol
        res(i, 5) = 1;
    end % End if
    
end % End parfor

for i = 1:nalgs
    checkres(algs(i), res(:, i));
end % End for

if sum(sum(res)) == ntest * nalgs
    fprintf("\nAll algorithms PASSED.\n");
end % End if


