function [lbd] = eiginvpower(A, maxiter)
% Numerical Analysis Review. Chapter 6 invpower
% Gwz, Shanghai University of Finance and Economics

[~, n] = size(A);
y = ones(n, 1);
lbd = 0;

for i = 1:maxiter
    
    y = A \ y;
    [~, idx] = max(abs(y));
    lbd = y(idx);
    y = y / lbd;
   
end % End for

lbd = 1 / lbd;

end % End function