function [x] = usolve(U, b)
% Numerical Analysis Review. Chapter 1 usolve
% Gwz, Shanghai University of Finance and Economics

if ~ istriu(U)
    error("U must be upper-triangular");
end % End if

n = length(b);

for k = n:-1:1
    if abs(U(k, k)) < 1e-10
        warning("Numerical singularity encountered.");
    end % End if
  
    b(k) = (b(k) - U(k, k + 1:end) * b(k + 1:end)) / U(k, k); 
end % End for

x = b;
end % End function