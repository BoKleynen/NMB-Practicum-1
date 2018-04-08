function i = binarySearch(x, t)
%{
Returns the index of the interval in which x lies.

args:
    x: x
    t: array

%}
iMid = idivide(length(t), 2, 'floor');

if x < t(iMid)
    i = binarySearch(x, t(1:iMid));
elseif x >= t(iMid+1)
    i = iMid + binarySearch(x, t(iMid:end));
else
    i = iMid;
end

