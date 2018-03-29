u = @(x,y) exp(x+y);
uw = @(y) u(0,y);
uo = @(y) u(1,y);
uz = @(x) u(1,0);
un = @(x) u(x,1);
f = @(x,y) exp(x+y);
N=8;
h = 1/(N+1);

[X,Y] = meshgrid(h:h:1-h);
F = f(X,Y);
max(max((PDE(f, N, uw, uo, uz, un) - F) ./ F))
