N = 10;
f = @(x) 0;
u = @(x) 1;
U = PDE(f, N, u, u, u, u)