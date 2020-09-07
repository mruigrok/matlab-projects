%function
f =@(x) cos(log(x));

%interval and reference
a = 0.001; b = (5/2)*pi;
ref = quad(f,a,b,1e-10);

%composite simpson using 'n' intervals
n = 1; eS = 1;
while (eS >= 1e-8)
   [eT, eM, eS] = error_int(f,a,b,n,ref);
   n = n + 1;
end

%Get count using adaptive simpson count function
[Q, count] = adaptive_simpson_count(f,a,b,1e-8);

%plot the function
x = linspace(a,b,1000);
plot(x,f(x));
ylim([-1.5,1.5]);
xlabel('x');
ylabel('f(x)');
title("cos(log(x))");

fprintf("C1: %d\nC2: %d\n", n, count);
fprintf("Composite Simpson error: %e\nAdaptive Simpson error: %e\n", eS, abs(Q - ref));
fprintf("Composite uses %f times more function calls\n", n/count);
