function t = knotPoints(t0, tn, k, n)
%{ 
    Creates an array of equidistant knot points spaced `deltaT`.
    Includes 2k extra points, k left of t0 and k right of tn for use with
    B-Splines.

    args:
        t0: start of the interval
        tn: end of the interval
        n: amount of knot points from t0 to tn

    result:
        t: array of n + 2k + 1 knot points
        
%}
    deltaT = (tn-t0)/n;
    t = t0-(k*deltaT):deltaT:tn+(k*deltaT);
end
