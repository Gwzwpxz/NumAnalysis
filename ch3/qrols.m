function [x] = qrols(A, b)
% Numerical Analysis Review. Chapter 3 qrols
% Gwz, Shanghai University of Finance and Economics

[m, n] = size(A);

if m < n
    error("More columns than rows");
end % End if

if length(nonzeros(A)) / (m * n) <= 0.1
    [Q, R] = givens(A);
else
    [Q, R] = hhqr(A);
end % End if

R1 = R(1 : n, :);
QTb = Q' * b;
x = usolve(R1, QTb(1 : n)); 

end % End function