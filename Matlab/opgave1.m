N = 5;
f = @(x) zeros(size(x));
u = @(x) 1;
U = PDE(f, N, u, u, u, u)