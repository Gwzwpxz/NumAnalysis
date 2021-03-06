function x = cg(A, b, maxiter, tol)
% Numerical Analysis Review. Chapter 5 steepdct
% Gwz, Shanghai University of Finance and Economics

[~, n] = size(A);
x = zeros(n, 1);
p = zeros(n, 1);
bnorm = norm(b);
res = A * x - b;

for i = 1:maxiter
    
    rnormpres = norm(res);
  
    if rnormpres / bnorm < tol
        break;
    end % End if
    
    if i == 1
        p = - res;
    else
        p = - res + (rnormpres / rnormprev)^2 * p;
    end % End if
    
    w = A * p;
    alpha = rnormpres^2 / (p' * w);
    x = x + alpha * p;
    res = res + alpha * w;
    rnormprev = rnormpres;
    
end % End for

end % End function