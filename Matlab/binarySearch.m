function i = binarySearch(x, t)
%{
Returns the index of the interval in which x lies.

args:
    x: x
    t: array of knot points

%}
iMid = idivide(length(t), int32(2), 'floor');

if x < t(iMid)
    i = binarySearch(x, t(1:iMid));
elseif x >= t(iMid+1)
    i = iMid + binarySearch(x, t(iMid+1:end));
else
    i = iMid;
end
