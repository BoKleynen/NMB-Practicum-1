u = @(x,y) exp(x+y);
uw = @(y) u(0,y);
uo = @(y) u(1,y);
uz = @(x) u(x,0);
un = @(x) u(x,1);
f = @(x,y) 2*exp(x+y);
% N=256;
% h = 1/(N+1);
% 
% [X,Y] = meshgrid(h:h:1-h);
% U = u(X,Y);
% max(max(abs((PDE(f, N, uw, uo, uz, un) - U) ./ U)))
Result = [];
for n = 3:10
    N = 2.^n
    h = 1/(N+1);
    [X,Y] = meshgrid(h:h:1-h);
    U = u(X,Y);
    tic
    solution = PDE(f, N, uw, uo, uz, un);
    toc
    Result = [Result; max(max(abs((solution - U) ./ U)))];
end
Result