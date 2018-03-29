u = @(x,y) exp(x+y);
uw = @(y) exp(y);
uo = @(y) exp(1+y);
uz = @(x) exp(x);
un = @(x) exp(1+x);
f = @(x,y) 2*exp(x+y);
% N=256;
% h = 1/(N+1);
% 
% [X,Y] = meshgrid(h:h:1-h);
% U = u(X,Y);
% max(max(abs((PDE(f, N, uw, uo, uz, un) - U) ./ U)))
Result = [];
for n = 3:10
    h = 1/((2.^n)+1);
    [X,Y] = meshgrid(h:h:1-h);
    U = u(X,Y);
    Result = [Result; max(max(abs((PDE(f, 2.^n, uw, uo, uz, un) - U) ./ U)))];
end
Result