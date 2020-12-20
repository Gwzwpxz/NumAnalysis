function [eigvals] = eighessberg(A, maxiter)
% Numerical Analysis Review. Chapter 6 power
% Gwz, Shanghai University of Finance and Economics

[m, n] = size(A);

if ~(m == n)
    error("A must be a square matrix.");
end % End

A = hessberg(A);

for i = 1:maxiter
    
    [Q, R] = givenshess(A);
    A = R * Q;
    
end % End for

eigvals = diag(R);

end % End function