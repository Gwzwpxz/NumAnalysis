function x = steepdct(A, b, maxiter, tol)
% Numerical Analysis Review. Chapter 5 steepdct
% Gwz, Shanghai University of Finance and Economics

[~, n] = size(A);
x = zeros(n, 1);
bnorm = norm(b);

for i = 1:maxiter
    
    res = A * x - b;
    rnorm = norm(res);
    rAnorm = res' * A * res;
    
    if norm(res) / bnorm < tol
        break;
    end % End if
    
    x = x - (rnorm^2 / rAnorm) * res;
    
end % End for

end % End function
