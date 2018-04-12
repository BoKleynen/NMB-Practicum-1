t0 = -1;
tn = 1;
k = 3;

x = linspace(t0, tn, 200)';
f = sin(20*x)./(100*x.^2+5);
f_ruis = f + 0.04*randn(size(x));
err = [];

for n = 10:300
    t = knotPoints(t0, tn, k, n);
    z = kkbSpline(t, x, f_ruis, x, k);
    err(n-9, 1) = n;
    err(n-9, 2) = norm(f - z);
    err(n-9, 3) = norm(f_ruis - z);
end

fig = figure;
plot(err(:,1), err(:,2), 'r', err(:,1), err(:,3), 'b');
saveas(fig,'../Verslag/ErrorBSplines.eps','epsc')

[minimumErrorF, minimumNF] = min(err(:,2));
[minimumErrorFRuis, minimumNFRuis] = min(err(:,3));

t = knotPoints(t0, tn, k, minimumNF);
z = kkbSpline(t, x, f, x, k);

fig2 = figure;
plot(x,z,'r',x,f,'b')
saveas(fig2,'../Verslag/PlotSplinesNoNoise.eps','epsc')

t = knotPoints(t0, tn, k, minimumNFRuis);
z_ruis = kkbSpline(t, x, f_ruis, x, k);

fig3 = figure;
plot(x,f_ruis,'r',x,z_ruis,'b')
saveas(fig3,'../Verslag/PlotSplinesNoise.eps','epsc')
