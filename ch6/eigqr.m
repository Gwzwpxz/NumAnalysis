function [eigvals, Q] = eigqr(A, maxiter)
% Numerical Analysis Review. Chapter 6 eigqr
% Gwz, Shanghai University of Finance and Economics

[m, n] = size(A);

if ~(m == n)
    error("A must be a square matrix.");
end % End

for i = 1:maxiter
    
    [Q, R] = hhqr(A);
    A = R * Q;
    
end % End for

eigvals = diag(R);

end % End function