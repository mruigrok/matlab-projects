function Q = adaptive_simpson(f, a, b, tol, depth)
    %Function to compute the integral using adaptive Simpson 
    %method of function f over the interval [a, b] to an 
    %accuracy of tol and/or a max recursive depth of 1000
    
    %If it is the first call depth is 0
    if(nargin == 4)
        depth = 0;
    end
    
    %If it is a function of one variable
    if(nargin(f) == 1)
        if(depth <= 1000)
            fprintf("Recursion depth: %d\n", depth);
            h = b - a; c = (a + b)/2;
            fa = f(a);
            fb = f(b);
            fc = f(c);
            S1 = (h/6)*(fa + 4*fc+ fb);
            S2 = (h/12)*(fa + 4*f((a+c)/2) + 2*fc+ 4*f((c+b)/2) + fb);
            E2 = (S2 - S1)/15;
            if( abs(E2) <= tol)
                Q = S2 + E2;
            else
                Q1 = adaptive_simpson(f,a,c,tol/2,depth + 1);
                Q2 = adaptive_simpson(f,c,b,tol/2,depth + 1);
                Q = Q1 + Q2;
            end  
        
        %Recursive depth exceeded trying to find digits accurate up
        %to tol, so just return the Simpson over that range
        else
            h = b - a;
            c = (a + b)/2;
            Q = (h/6)*(f(a) + 4*f(c) + f(b));
        end   
    end
             
end        
