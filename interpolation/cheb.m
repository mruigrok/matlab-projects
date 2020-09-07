function y = cheb(a,b,n)
    %Function to compute 'n' Chebyshev points of an interval [a,b]
    if(a == b)
       fprintf("Enter a correct interval");
       return
    end
    for k = 1:n
        y(k) = (0.5)*(a+b) + (0.5)*(b-a)*cos(pi*(2*k - 1)/(2*n));
    end
end