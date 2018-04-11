function i = binarySearch(x, t)
%{
    Returns the index of the interval in which x lies.

    args:
        x: x
        t: array of knot points
%}

    r = 10;
    iMid = idivide(length(t), int32(2), 'floor');

    if round(x, r) < round(t(iMid), r)
        i = binarySearch(x, t(1:iMid));
    elseif round(x, r) >= round(t(iMid+1), r)
        i = iMid + binarySearch(x, t(iMid+1:end));
    else
        i = iMid;
    end
end
