function [Q, R] = givenshess(A)
% Numerical Analysis Review. Chapter 6 givenshess
% Gwz, Shanghai University of Finance and Economics
[m, n] = size(A);
R = A;
Q = eye(m);

for j = 1:n-1
    for i = j + 1
        
        [R(j, j : end), R(i, j : end), Q(:, j), Q(:, i)] =...
            givensrotate(R(j, j : end), R(i, j : end), Q(:, j), Q(:, i));
        
    end % End for
end % End for

end % End function