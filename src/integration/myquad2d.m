function Q = myquad2d(fun, a, b, c, d, tol)
    %Approximate the integral of fun(x, y) over [a,b] and
    %[c, d] by calling adaptive Simpson with tolerance tol
    
    F =@(x) (adaptive_simpson(@(y) fun(x,y),c,d,tol));
    Q = adaptive_simpson(F,a,b,tol);
  
end