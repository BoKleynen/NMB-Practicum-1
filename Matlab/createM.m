function M = createM(xArr, tArr, r, order, n)
%{
args:
    xArr: array of x values (length r)
    tArr: array of knot points (length n + 2*order + 1)
    r: 
    order: the order of the B-splines
    n: 
    
%}
    M = zeros(r, n+order);
    
    for row = 1:r+1
        j = order;
        x = xArr(row);
        
        BSplines = zeros(j);
        BSplines(j+1) = 1;
        
        for k = 2:order+2
            BSplines(j-k) = (tArr(j+k+1) - x)/(tArr(j+k+1) - tArr(j+1));
            
            for l = j-1:-1:j-k
                i = j-l;
                BSplines(i) = (x - tArr(i))/(tArr(i+k) - tArr(i))*BSplines(i) ...
                                + (tArr(i+k+1) - x)/(tArr(i+k+1) - tArr(i+1))*BSplines(i+1);
            end
            
            BSplines(j) = (x - tArr(j))/(tArr(j+k) - tArr(j))*BSplines(j);
        end
        
        index = binarySearch(x, tArr);
        M(j,index-k:index) = BSplines;
    end
end