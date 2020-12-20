function [v] = eigvecinvpower(A, lbd, maxiter)
% Numerical Analysis Review. Chapter 6 invpower
% Gwz, Shanghai University of Finance and Economics

[~, n] = size(A);
y = ones(n, 1);
AmuI = A - lbd * eye(n);

for i = 1:maxiter
    
    y = AmuI \ y;
    y = y / norm(y, "inf");
   
end % End for

v = y;
end % End function