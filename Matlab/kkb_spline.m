function z = kkb_spline(t,x,f,y,k)
%{
args:
    t: array of knot points (length n+2k+1).
    x: array of x-values for which f(x) is known (length r).
    f: array of function values (length r).
    y: array of x-values for which an approximation has to be calculated
       (length N).
    k: degree of the B-splines.

result:
    z: arra of approximations of y (length N).
%}

    if length(f) ~= length(x)
        error('f and x should have the same dimensions.');
    end
    r = length(f);
    n = length(t) - 2*k - 1;
    M = createM(x, t, r, k+1, n);
    c = f\M;
    
    z = zeros(length(y));
    
    for i = length(y)
        j = binarySearch(x, t);
        z(i) = deBoor(x, t, k, c, j);
    end
end