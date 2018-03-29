N = 128;
uw = @(y) 3;
uo = @(y) 2;
uz = @(x) 2 + sin(pi*x/2);
un = @(x) 1;

U = PDE(@f, N, uw, uo, uz, un);
h = 1/(N+1);
[X, Y] = meshgrid(h:h:1-h);
surf(X, Y, U)
contour(X,Y,U)

function z = f(x, y)
    temp = (0.4 <= x) & (x <= 0.6) & (0.4 <= y) & (y <= 0.6);
    z = temp .* (-100);
end