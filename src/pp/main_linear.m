%Script given to me to test accuracy of functions
%NN (Avenue2L)

clear
warning('off')
f = fopen('linearsolve.dat','w');


fprintf(f, '% 3s  %10s %20s %20s %20s  \n',...
    'n', 'cond(A)', 'Matlab', 'lu_pp', 'lu_spp');
fprintf(f,' %25s  %12s  %8s %12s %10s %12s\n',...
    'error', 'residual', 'error', 'residual', 'error', 'residual');

fprintf( '% 3s  %10s %20s %20s %20s  \n',...
    'n', 'cond(A)', 'Matlab', 'lu_pp', 'lu_spp');
fprintf(' %25s  %12s  %8s %12s %10s %12s\n',...
    'error', 'residual', 'error', 'residual', 'error', 'residual');
fprintf('Vandermonde matrices (flipped with fliplr)\n');

fprintf(f, 'Vandermonde matrices (flipped with fliplr)\n');
for i = 5:1:15
    v = 1:1:i;
    A = vander(v);
    A = fliplr(A);
    n = length(v);
    x = ones(n,1);
    b = A*x;
    [xm, xpp, xspp] = solve_all(A,b);
    out(f, n, cond(A), norm(xm-x), norm(b-A*xm), norm(xpp-x), ....
        norm(b-A*xpp), norm(xspp-x), norm(b-A*xspp) );
end

fprintf(f,'Hilbert matices\n');
fprintf('Hilbert matices\n');

for n=2:15
    A = hilb(n);
    x = ones(n,1);
    b = A*x;
    [xm, xpp, xspp] = solve_all(A,b);
   out(f, n, cond(A), norm(xm-x), norm(b-A*xm), norm(xpp-x), ....
        norm(b-A*xpp), norm(xspp-x), norm(b-A*xspp) );
    
    
end

fprintf(f,'Random matrices \n');
fprintf('Random matrices \n');; 
N = [10 100 1000 2000];
for n= N
    A = rand(n,n);
    x = ones(n,1);
    b = A*x;
    [xm, xpp, xspp] = solve_all(A,b);
    
    out(f, n, cond(A), norm(xm-x), norm(b-A*xm), norm(xpp-x), ....
        norm(b-A*xpp), norm(xspp-x), norm(b-A*xspp) );
end
fclose(f);

function out(f, n, condA, e1, r1, e2, r2, e3, r3)
    fprintf(f,'%4d     %.1e     %.1e     %.1e     %.1e     %.1e     %.1e     %.1e  \n', ...
    n, condA, e1, r1, e2, r2, e3, r3);
    fprintf('%4d     %.1e     %.1e     %.1e     %.1e     %.1e     %.1e     %.1e  \n', ...
    n, condA, e1, r1, e2, r2, e3, r3);
end


    
