function s = deBoor(x, t, k, c, j)
%{ 
evaluates s(x)

Args:
    x: x to be evaluated
    t: array knot points
    k: degree of B-spline
    c: coefficients
 
%}

% TODO: check ranges for off by one mistakes.
for r = 1:k
    % reverse order for lower memory use (matlab functions should be call
    % by value).
    for i = j:-1:j-k+r
        alpha = (x-t(i))/(t(i+k+1-r)-t(i));
        c(i) = alpha*c(i) + (1-alpha)*c(i-1);
    end
end
s = c(j);
end