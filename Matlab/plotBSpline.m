function [x,y] = plotBSpline(t0,tn,k,i)
    interval = 1;
    n = (tn - t0)/interval;
    t = knotPoints(t0, tn, k, n);
    c = zeros(n+k);
    a = i + k + 1;
    c(a) = 1;
    xArr = t0:0.01:tn;
    yArr = zeros(length(xArr));

    for l = 1:length(xArr)
        yArr(l) = deBoor(xArr(l), t, k, c, binarySearch(xArr(l), t));
    end
    x = xArr;
    y = yArr;
end
