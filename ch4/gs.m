function [x] = gs(A, b, maxiter, tol)
% Numerical Analysis Review. Chapter 1 test
% Gwz, Shanghai University of Finance and Economics

L = - tril(A, -1);
U = - triu(A, 1);
d = diag(A);
D = diag(d);

M = (D - L) \ U;
g = (D - L) \ b;

n = length(d);
x = zeros(n, 1);

for i = 1:maxiter
    
    if norm(A * x - b) / norm(b) < tol
        break;
    end % End if
    
    x = M * x + g;
    
end % End for

end % End function