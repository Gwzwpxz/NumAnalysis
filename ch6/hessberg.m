function [A] = hessberg(A)
% Numerical Analysis Review. Chapter 6 power
% Gwz, Shanghai University of Finance and Economics

[~, n] = size(A);

for i = 1:n-2
    
    [v, beta] = hh(A(i + 1:end, i));
    A(i + 1:end, i:end) = A(i + 1:end, i:end) -...
        beta * (v * v') * A(i + 1:end, i:end);
    
    A(1:end, i + 1:end) = A(1:end, i + 1:end) - ...
        beta * A(1:end, i + 1:end) * (v * v');
    
end % End for

end % End function