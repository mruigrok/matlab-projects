function [xm, xpp, xspp] = solve_all(A, b)
    %Solves a linear system A*x = b using Matlab’s lu and 
    %lu_pp and lu_spp. 
    %Returns 
    %xm = A\b 
    %xpp solution computed using lu_pp and lu_solve 
    %xspp solution computed using lu_spp and lu_solve

    %Matlab defined lu() function
    [L,U,P] = lu(A);
    ym = L\(P*b);
    xm = U\ym;

    %Using pp and spp funtions to get [L,U,P]
    [pp_L, pp_U, pp_P] = lu_pp(A);
    [spp_L, spp_U, spp_P] = lu_spp(A);

    %Solving for x
    xpp = lu_solve(pp_L, pp_U, pp_P*b);
    xspp = lu_solve(spp_L, spp_U, spp_P*b);

end