f = @(x,y) exp(x-y).* sin(x+y); 
a = 0;
b = 1; 
c = 0; 
d = 1; 
tol = 1e-8; 
Q = myquad2d(f,a,b,c,d,tol); 
err = abs(Q-quad2d(f,a,b,c,d,'AbsTol', 1e-12)) 
fprintf("Integral value: %e\n", Q);
fprintf("Error: %e\n", err);
