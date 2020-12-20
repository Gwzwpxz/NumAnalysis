function [L, d] = ldldcp(A)
% Numerical Analysis Review. Chapter 1 ldldcp
% Gwz, Shanghai University of Finance and Economics

[~, n] = size(A);

if ~ issymmetric(A)
    error("A must be symmetric");
end % End if

% Self-implementation
L = eye(n, n);
d = zeros(n, 1);

for k = 1:n
    for m = 1:k - 1
        L(k, m) = A(k, m) - L(k, 1:m - 1) * (d(1:m - 1).* L(m, 1:m - 1)');
        L(k, m) = L(k, m) / d(m);
    end % End for
    
    d(k) = A(k, k) - L(k, 1:k - 1) * (d(1:k - 1).*L(k, 1:k - 1)');
end % End for

end % End function