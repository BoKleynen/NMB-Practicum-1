function z = kkb_spline(tArr,xArr,f,y,k)
%{
args:
    t: array of knot points (length n+2k+1).
    x: array of x-values for which f(x) is known (length r).
    f: array of function values (length r).
    y: array of x-values for which an approximation has to be calculated
       (length N).
    k: degree of the B-splines.

result:
    z: array of approximations of y (length N).
%}

    if length(f) ~= length(xArr)
        error('f and x should have the same dimensions.');
    end
    r = length(f);
    n = length(t) - 2*k - 1;
    
    indexArr = zeros(r);
    for i = 1:r
        indexArr(i) = binarySearch(xArr(i), t);
    end
    
    M = zeros(r, n+order);
    for row = 1:r
        j = order;
        x = xArr(row);
        
        BSplines = zeros(j);
        BSplines(j) = 1;
        
        for k = 1:order
            BSplines(j-k) = (tArr(j+k+1) - x)/(tArr(j+k+1) - tArr(j+1));
            
            for i = j-k+1:j-1
                BSplines(i) = (x - tArr(i))/(tArr(i+k) - tArr(i))*BSplines(i) ...
                                + (tArr(i+k+1) - x)/(tArr(i+k+1) - tArr(i+1))*BSplines(i+1);
            end
            
            BSplines(j) = (x - tArr(j))/(tArr(j+k) - tArr(j))*BSplines(j);
        end
        
        M(row,indexArr(row)-k:indexArr(row)) = BSplines;
    end
    
    c = f\M;
    
    z = zeros(length(y));
    for i = 1:length(y)
        z(i) = deBoor(xArr, t, k, c, indexArr(i));
    end
end