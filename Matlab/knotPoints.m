function t = knotPoints(t0, tn, k, interval)
%{
Generates an array of equidistant knot points for splines of degree k
along [t0, tn]
%}
    t = t0-(k*interval):interval:tn+(k*interval);
end

