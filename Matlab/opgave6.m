t0 = -1;
tn = 1;
k = 3;

x = linspace(t0, tn, 200)';
f = rectangularPulse(x);

t = knotPoints(t0, tn, k, 20);
z1 = kkbSpline(t, x, f, x, k);
length(t)

t2 = [-1.5,-1.33, -1.16,-1,-0.6,-0.51,-0.505,-0.5025,-0.50125,-0.5005, ...
        -0.5,-0.499,-0.4985,0.4985,0.499,0.5,0.5005, ...
        0.50125, 0.5025,0.505,0.51,0.6,1,1.16,1.33,1.5];
z2 = kkbSpline(t2, x, f, x, k);
length(t2)

fig = figure;
plot(x,f,'r',x,z1,'b',x, z2, 'g')
axis([-1 1 -0.1 1.1])
saveas(fig,'../Verslag/Rectan.eps','epsc')

fig2 = figure;
plot(x,f,'r',x,z1,'b',x, z2, 'g')
axis([-0.52 -0.48 -0.1 0.35])
saveas(fig2,'../Verslag/RectanZoom.eps','epsc')
