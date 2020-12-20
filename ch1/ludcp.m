function [L, U, p] = ludcp(A, ispvt)
% Numerical Analysis Review. Chapter 1 ludcp
% Gwz, Shanghai University of Finance and Economics

if nargin == 1
    ispvt = false;
end % End if

[n, ~] = size(A);
p = 1:n;

if ~ ispvt
    
    for k = 1:n - 1
        if abs(A(k, k)) < 1e-10
            warning("Potential numerical issues");
        end % End if
        
        A(k + 1 : end, k) = A(k + 1: end, k) / A(k, k);
        A(k + 1 : end, k + 1 : end) = ...
            A(k + 1 : end, k + 1 : end) - A(k + 1 : end, k) * A(k, k + 1 : end);
    end % End for
    
else
    
    for k = 1:n - 1
        
        [~, q] = max(abs(A(k:end, k)));
        q = q + k - 1;
        A([k, q], :) = A([q, k], :);
        p([k, q]) = p([q, k]);
       
        if abs(A(k, k)) < 1e-10
            warning("Potential numerical issues");
        end % End if
        
        A(k + 1 : end, k) = A(k + 1: end, k) / A(k, k);
        A(k + 1 : end, k + 1 : end) = ...
            A(k + 1 : end, k + 1 : end) - A(k + 1 : end, k) * A(k, k + 1 : end);
    end % End for
    
    
end % End if

L = tril(A, -1) + eye(n);
U = triu(A);

end % End function