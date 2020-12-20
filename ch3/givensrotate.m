function [x,y,u,v] = givensrotate(x,y,u,v)
% Givens rotation, Algorithm 5.1.5, p. 202 & Algorithm 5.1.6, p. 203,
% Golub & Van Loan, Matrix Computations, 2nd edition

a = x(1);
b = y(1);

if b == 0
    return;
else
    if abs(b) > abs(a)
        t = - a / b; 
        s = 1 / sqrt(1 + t^2); 
        c = s * t;
    else
        t = - b / a; 
        c = 1 / sqrt(1 + t^2); 
        s = c * t;
    end % End if
end % End if

x0 = x;
u0 = u;

x(:) = c*x0 - s*y;  
u(:) = c*u0 - s*v;
y(:) = s*x0 + c*y;  
v(:) = s*u0 + c*v;

end % End function