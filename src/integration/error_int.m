function [eT, eM, eS] = error_int(f, a, b, n, ref) 
    % Evaluates the integral of f over [a,b] using 
    %n(i) subintervals . 
    %n is a row integer vector . ref is an accurate value for this 
    % integral 
    %eT(i), eM(i), eS(i) are absolute errors in 
    % the composite trapezoid , midpoint , and Simpson , 
    % respectively , when evaluated over n(i) subintervals .
    
    eT = zeros(1,length(n));
    eM = zeros(1,length(n));
    eS = zeros(1,length(n));
   
    %Point spacing used by all methods
    h = (b-a)./n;
    
    %Composite trapezoid method
    trap =@(h) 0.5*h*(f(a) + 2*sum(f((a+h):h:(b-h)))+ f(b));
    eT = abs(arrayfun(trap, h) - ref);
    
    %Composite midpoint method
    mid =@(h) h*sum(f((a+h/2):h:(b-h/2)));
    eM = abs(arrayfun(mid,h) - ref);
    
    %Composite Simpson method
    simp =@(h) (h/3)*(f(a) + 2*sum(f((a+2*h):2*h:(b-h))) + 4*sum(f((a+h):2*h:(b-h))) + f(b));
    eS = abs(arrayfun(simp,h) - ref);
    
end