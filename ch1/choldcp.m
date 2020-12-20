function [L] = choldcp(A)
% Numerical Analysis Review. Chapter 1 choldcp
% Gwz, Shanghai University of Finance and Economics

[~, n] = size(A);

if ~ issymmetric(A)
    error("A must be symmetric");
end % End if

% Self-implementation
L = zeros(n, n);

for k = 1:n
    for m = 1:k - 1
        L(k, m) = A(k, m) - L(k, 1:m - 1) * L(m, 1:m - 1)';
        L(k, m) = L(k, m) / L(m, m);
    end % End for
    
    L(k, k) = sqrt(A(k, k) - norm(L(k, 1:k - 1))^2);
end % End for

% % Implementation form textbook
% for k = 1:n
%     A(k, k) = sqrt(A(k, k));
%     A(k + 1 : end, k) = A(k + 1 : end, k) / A(k, k);
%     
%     for j = k + 1 : n
%         A(j : n, j) = A(j : n, j) - A(j : n, k) * A(j, k);
%     end % End for
%     
% end % End for
% 
% L = tril(A);

end % End function