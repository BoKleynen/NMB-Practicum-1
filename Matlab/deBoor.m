function s = deBoor(x, t, k, c, j)
%{ 
evaluates s(x)

Args:
    x: x to be evaluated
    t: array of knot points (length n + 2k + 1)
    k: degree of B-spline
    c: coefficients (length n+k)
 
%}
    if x >= t(end-2*k+1)
        s = 0;
    else
        for r = 1:k
            for i = j:-1:j-k+r
                alpha = (x-t(i))/(t(i+k+1-r)-t(i));
                c(i) = alpha*c(i) + (1-alpha)*c(i-1);
            end
        end
        s = c(j);
    end
end