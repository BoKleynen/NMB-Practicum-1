N = 5;
f1 = @(x,y) zeros(size(x));
u1 = @(x) 1;
U = PDE(f1, N, u1, u1, u1, u1)

