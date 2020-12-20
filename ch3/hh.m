function [v, beta] = hh(x)
% Numerical Analysis Review. Chapter 3 hh
% Gwz, Shanghai University of Finance and Economics

[m, n] = size(x);

if (~ (n == 1)) || m <= 1
    error("Dimension mismatch: x is assumed a column vector, " + ... 
        "got input size (" + m + ", " + n + ").");
end % End if

v = zeros(m, 1);
x = x / max(abs(x));
v(2:end) = x(2:end);
sigma = norm(x(2:end))^2;

if sigma < 1e-12
    beta = 0;
else
    
    alpha = sqrt(x(1)^2 + sigma);
    
    if x(1) <= 0
        v(1) = x(1) - alpha;
    else
        v(1) = - sigma / (x(1) + alpha);
    end % End if
    
    beta = 2 * v(1)^2 / (sigma + v(1)^2);
    v = v / v(1);
    
end % End if

end % End function
