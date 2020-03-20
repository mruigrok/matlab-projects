%Use adaptive_simpson to compute the integral over range[0,pi/2]
y = @(x,theta) 1./(sqrt(1 - (x.^2)*sin(theta)^2))
K =@(x) (adaptive_simpson(@(theta) y(x,theta),0,pi/2,10e-6));

%-1 and 1 cause infinities so avoid them
x = linspace(-1,1,1000);
result = arrayfun(K,x(2:end-1));

%Plot the result
plot(x(2:end-1), result);
title("Elliptical integral of the first kind");
xlabel("x");
ylabel("K(x)");
    

 