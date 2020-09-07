clear all; close all;
f = @(x) sin(pi*x.*x/3);
a=0; b = 1;
N = 2.^[2:20];
ref = quad(f,a,b, 1e-15);
[eT, eM, eS ] = error_int(f, a, b, N, ref);
loglog(1./N, eT,'go--', 1./N, eM,'b*--', 1./N, eS, 'rd--');
legend('Trapezoid', 'Midpoint', 'Simpson', 'Location', 'NorthWest');
set(gca, 'FontSize', 18)
print('-depsc2', 'main_int.eps');

