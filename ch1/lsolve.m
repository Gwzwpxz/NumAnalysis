function [x] = lsolve(L, b)
% Numerical Analysis Review. Chapter 1 lsolve
% Gwz, Shanghai University of Finance and Econmics

if ~ istril(L)
    error("L must be lower-triangular");
end % End if

n = length(b);

for k = 1:n
    if abs(L(k, k)) < 1e-10
        warning("Numerical singularity encountered.");
    end % End if
  
    b(k) = (b(k) - L(k, 1:k - 1) * b(1:k - 1)) / L(k, k); 
end % End for

x = b;
end % End function