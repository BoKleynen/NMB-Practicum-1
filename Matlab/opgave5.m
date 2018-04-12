[spline1X,spline1Y] = plotBSpline(0,8,3,0);
[spline2X,spline2Y] = plotBSpline(0,8,3,1);
[spline3X,spline3Y] = plotBSpline(0,8,3,2);
[spline4X,spline4Y] = plotBSpline(0,8,3,3);
[spline5X,spline5Y] = plotBSpline(0,8,3,4);
fig = figure;
plot(spline1X,spline1Y,spline2X,spline2Y,spline3X,spline3Y,...
    spline4X,spline4Y,spline5X,spline5Y);
saveas(fig,'../Verslag/BSplines.eps','epsc')