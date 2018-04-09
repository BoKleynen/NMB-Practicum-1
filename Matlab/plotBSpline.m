% N(0, 4)(x)
t = -1.5:0.5:5;
k = 3;
c = zeros(11);
c(4) = 1;
xArr = 0:0.1:t(4+k+1);
yArr = zeros(length(xArr));

for l = 1:length(xArr)
    yArr(l) = deBoor(xArr(l), t, k, c, 4);
end

plot(xArr, yArr)