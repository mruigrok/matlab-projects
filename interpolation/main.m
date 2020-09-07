%SE 4X03 Assignment #2
%Matthew Ruigrok

%Main Script for testing

%Q5

f1 = @(x) sqrt(x);

x = linspace(1,2,5);
y = arrayfun(f1,x);
p = polyfit(x,y,4);

x2 = linspace(1,2,200);
p_x = polyval(p,x2);
f_x = arrayfun(f1,x2);

error = abs(p_x - f_x);

semilogy(x2, error);
ylabel('Error')
xlabel('x')
title('|p(x) - f(x)|')

%Q7
%Test function
f2 = @(x) x^2/(1+x^2);

%(a)
%Points for plotting original f(x)
x = linspace(-pi,pi);
y = max_sin_zero(x);
%y = arrayfun(f2,x);
%Interpolating
x1 = linspace(-pi, pi, 21);
y1 = max_sin_zero(x1);
%y1 = arrayfun(f2,x1);
p = polyfit(x1,y1,20);

%Getting 200 interpolated points
x2 = linspace(-pi, pi, 200);
y2 = polyval(p, x2);


hold on
plot(x,y);
plot(x1,y1,'o')
plot(x2,y2)
title('Polyfit Interpolation with 21 evenly spaced points')
xlabel('x')
ylabel('y')
xlim([-2.5 2.5])
legend('f(x)','data points','p(x)');
hold off

% (b)
% Using spline instead of polyfit
x4 = linspace(-pi,pi,200);
y3 = spline(x,y,x4);

hold on
plot(x,y);
plot(x1,y1,'o')
plot(x4,y3);
title('Spline Interpolation with 21 evenly spaced points')
xlabel('x')
ylabel('y')
legend('f(x)','data points','p(x)');
hold off

% (c)
% Ployfit with Chebyshev points
x_cheb = cheb(-pi,pi,21);
y_cheb = max_sin_zero(x_cheb);
p_cheb = polyfit(x_cheb,y_cheb,20);

%Get 200 interpolated values
x_cheb2 = linspace(-pi,pi,200);
y_cheb2 = polyval(p_cheb,x_cheb2);

hold on
plot(x_cheb,y_cheb,'o')
plot(x,y,'b');
plot(x_cheb2,y_cheb2);
title('Polyfit Interpolation with 21 Chebyshev points')
xlabel('x')
ylabel('y')
legend('data points','f(x)', 'p(x)');







