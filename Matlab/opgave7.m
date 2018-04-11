t0 = -1;
tn = 1;
k = 3;

x = linspace(t0, tn, 20)';
f = sin(20*x)./(100*x.^2+5);
f_ruis = f + 0.04*randn(size(x));
err = zeros(10, 3);

% for q = 2:5
%     n = 2^q;
%     t = knotPoints(t0, tn, k, (tn-t0)/n);
%     z = kkb_spline(t, x, f_ruis, x, k);
%     err(q, 1) = n;
%     err(q, 2) = norm(f - z);
%     err(q, 3) = norm(f_ruis - z);
% end

% plot(err(:,1), err(:,2), 'r', err(:,1), err(:,3), 'b');
n = 50;
t = knotPoints(t0, tn, k, (tn-t0)/n);
z = kkb_spline2(t, x, f_ruis, x, k);
plot(x, f_ruis, 'g'); hold on;
plot(x, f, 'b'); hold on;
plot(x, z, 'r')
