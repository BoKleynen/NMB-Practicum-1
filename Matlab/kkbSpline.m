function z = kkbSpline(tArr,xArr,fArr,yArr,k)
%{
  args:
    tArr: array of n+2k+1 knot points.
    xArr: array of r x-values for which f(x) is known and given in fArr.
    fArr: array of r function values of elements in xArr.
    yArr: array of N x-values for which an approximation has to be 
          calculated
    k: degree of the B-splines.

  result:
    z: array N of approximations of y.
%}

  if length(fArr) ~= length(xArr)
      error('fArr and x should have the same dimensions.');
  end
  r = length(fArr);
  n = length(tArr) - 2*k - 1;

  M = zeros(r, n+k);
  for row = 1:r
    j = binarySearch(xArr(row), tArr);
    x = xArr(row);

    BSplines = zeros(1, n+k);
    BSplines(j) = 1;

    for l = 1:k
      BSplines(j-l) = ...
        (tArr(j+1)-x)/(tArr(j+1)-tArr(j-l+1))*BSplines(j-l+1);

      for i = j-l+1:j-1
        BSplines(i) = (x - tArr(i))/(tArr(i+l) - tArr(i))*BSplines(i) ...
            + (tArr(i+l+1) - x)/(tArr(i+l+1) - tArr(i+1))*BSplines(i+1);
      end

      BSplines(j) = (x - tArr(j))/(tArr(j+l) - tArr(j))*BSplines(j);
    end

    M(row,1:end) = BSplines(1:n+k);
  end

  c = fArr\M;
  z = zeros(size(yArr));
  for i = 1:length(yArr)
      z(i) = deBoor(yArr(i), tArr, k, c, binarySearch(yArr(i), tArr));
  end
end
