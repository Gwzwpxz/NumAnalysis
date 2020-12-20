function [Q, R] = hhqr(A)
% By Gwz, Shanghai University of Finance and Economics
% This function implements QR decomposition via Householder transformation 
% Reference: Numerical Linear Algebra, 2nd Edition (Textbook)
%            Slides of class

% Get size
[m, n] = size(A);

% Initialize Q
Q = eye(m);

for i = 1:n
    
    if i >= m
        break;
    end % End if

    [v, beta] = hh(A(i:end, i));
    H = eye(m - i + 1) - beta * (v * v');
    A(i:end, i:end) = H * A(i:end, i:end);
    Q = Q * blkdiag(eye(i - 1), H);
    
end % End for 

R = triu(A);
if m > n
    R = R(1:n, :);
end % End if
   
end % End function
