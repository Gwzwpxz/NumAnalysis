function [x] = sor(A, b, w, maxiter, tol)
% Numerical Analysis Review. Chapter 4 sor
% Gwz, Shanghai University of Finance and Economics

L = - tril(A, -1);
U = - triu(A, 1);
d = diag(A);
D = diag(d);
DwL = D - w * L;

M = DwL \ ((1 - w) * D + w * U);
g = w * (DwL \ b);

n = length(d);
x = zeros(n, 1);

for i = 1:maxiter
    
    if norm(A * x - b) / norm(b) < tol
        break;
    end % End if
    
    x = M * x + g;
    
end % End for

end % End function