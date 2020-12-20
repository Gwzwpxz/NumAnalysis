function [Q, R] = givens(A)
% Givens QR, Algorithm 5.2.2, p. 214, Golub & Van Loan, Matrix Computations, 2nd edition
[m, n] = size(A);
R = A;
Q = eye(m);

for j = 1:n
    for i = j + 1:m
        
        [R(j, j : end), R(i, j : end), Q(:, j), Q(:, i)] =...
            givensrotate(R(j, j : end), R(i, j : end), Q(:, j), Q(:, i));
        
    end % End for
end % End for

end % End function