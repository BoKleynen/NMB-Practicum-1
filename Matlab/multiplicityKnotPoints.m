function t = multiplicityKnotPoints(t0, tn, k, n, m, i)
%{ 
    Creates an array of knot points spaced `deltaT` with one point having 
    a higher multiplicity. 
    Includes 2k extra points, k left of t0 and k right of tn for use with
    B-Splines.

    args:
        t0: start of the interval
        tn: end of the interval
        n: amount of knot points from t0 to tn
        m: multiplicity of knotpoint i
        i: index of knotpoint with higher multiplicity. 

    result:
        t: array of n + 2k + 1 knot points
        
%}
    t = knotPoints(t0,tn,k,n);
    repeatedKnots = t(i) * ones(1, m-1);
    t = [t(1:i) repeatedKnots t(i+1:end)];
end