function z = kkb_spline(tArr,xArr,fArr,yArr,degree)
%{
args:
    tArr: array of knot points (length n+2k+1).
    xArr: array of x-values for which f(x) is known (length r).
    fArr: array of function values (length r).
    yArr: array of x-values for which an approximation has to be calculated
       (length N).
    degree: degree of the B-splines.

result:
    z: array of approximations of y (length N).
%}

    if length(fArr) ~= length(xArr)
        error('fArr and x should have the same dimensions.');
    end
    r = length(fArr);
    n = length(tArr) - 2*degree - 1;
    
    indexArr = zeros(r);
    for row = 1:r
        indexArr(row) = binarySearch(xArr(row), tArr);
    end
    
    M = zeros(r, n+degree);
    for row = 1:r
        j = degree+1;
        x = xArr(row);
        
        BSplines = zeros(1, j);
        BSplines(j) = 1;
        
        for k = 1:degree
            BSplines(j-k) = (tArr(j+k+1) - x)/(tArr(j+k+1) - tArr(j+1));
            
            for i = j-k+1:j-1
                BSplines(i) = (x - tArr(i))/(tArr(i+k) - tArr(i))*BSplines(i) ...
                                + (tArr(i+k+1) - x)/(tArr(i+k+1) - tArr(i+1))*BSplines(i+1);
            end
            
            BSplines(j) = (x - tArr(j))/(tArr(j+k) - tArr(j))*BSplines(j);
        end
        
        M(row,indexArr(row)-k:indexArr(row)) = BSplines;
    end
    
    c = fArr\M;
    
    z = zeros(size(yArr));
    for i = 1:length(yArr)
        z(i) = deBoor(xArr(i), tArr, degree, c, indexArr(i));
    end
end