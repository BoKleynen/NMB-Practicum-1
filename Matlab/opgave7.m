t0 = -1;
tn = 1;
k = 3;

x = linspace(t0, tn, 200)';
f = sin(20*x)./(100*x.^2+5);
f_ruis = f + 0.04*randn(size(x));
err = [];

for n = 5:300
    t = knotPoints(t0, tn, k, n);
    z = kkb_spline(t, x, f_ruis, x, k);
    err(n-9, 1) = n;
    err(n-9, 2) = norm(f - z);
    err(n-9, 3) = norm(f_ruis - z);
end

plot(err(:,1), err(:,2), 'r', err(:,1), err(:,3), 'b');
