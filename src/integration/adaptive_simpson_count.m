function [Q, count] = adaptive_simpson_count(f, a, b, tol, depth)
    %Function to compute the integral using adaptive Simpson 
    %method of function f over the interval [a, b] to an 
    %accuracy of tol and/or a max recursive depth of max_depth
    
    if(nargin == 4)
        depth = 0;
    end
    
    count = 1;
    if(depth <= 1000)
        fprintf("Recursion depth: %d\n", depth);
        h = b - a; c = (a + b)/2;
        S1 = (h/6)*(f(a) + 4*f(c) + f(b));
        S2 = (h/12)*(f(a) + 4*f((a+c)/2) + 2*f(c)+ 4*f((c+b)/2) + f(b));
        E2 = (S2 - S1)/15;
        if( abs(E2) <= tol)
            Q = S2 + E2;
        else
            [Q1, count1] = adaptive_simpson_count(f,a,c,tol/2,depth + 1);
            [Q2, count2] = adaptive_simpson_count(f,c,b,tol/2,depth + 1);
            Q = Q1 + Q2;
            count = count + count1 + count2;
        end  
        
    %Recursive depth exceeeded trying to find digits accurate up
    %to tol, so just return the Simpson over that range
    else
        h = b - a;
        c = (a + b)/2;
        Q = (h/6)*(f(a) + 4*f(c) + f(b));
    end
    
end        
