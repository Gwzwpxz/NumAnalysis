function [x] = ssor(A, b, w, maxiter, tol)
% Numerical Analysis Review. Chapter 1 test
% Gwz, Shanghai University of Finance and Economics

L = - tril(A, -1);
U = - triu(A, 1);
d = diag(A);
D = diag(d);
DwL = D - w * L;
DwL2 = D - w * U;

M1 = DwL \ ((1 - w) * D + w * U);
M2 = DwL2 \ ((1 - w) * D + w * L);
g1 = w * (DwL \ b);
g2 = w * (DwL2 \ b);

n = length(d);
x = zeros(n, 1);

for i = 1:maxiter
    
    if norm(A * x - b) / norm(b) < tol
        break;
    end % End if
    
    x1 = M1 * x + g1;
    x = M2 * x1 + g2;
    
end % End for

end % End function