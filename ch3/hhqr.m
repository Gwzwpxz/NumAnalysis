function [Q, R] = hhqr(A)
% Numerical Analysis Review. Chapter 1 hhqr
% Gwz, Shanghai University of Finance and Econmics

[m, n] = size(A);
Q = eye(m);

for i = 1:n
    
    if i >= m
        break;
    end % End if
    
    [v, beta] = hh(A(i : end, i));
    H = eye(m - i + 1) - beta * (v * v');
    A(i : end, i : end) = H * A(i : end, i : end);
    Q = Q * blkdiag(eye(i - 1), H);
    
end % End for 

R = triu(A);
   
end % End function
