function [L, U, P] = lu_pp(A)
    %[L,U,P] = lu_pp(A) computes a unit lower triangular matrix L, 
    %an upper triangular matrix U, and a permutation matrix P such that 
    %P*A = L*U. 
    %The LU factorization is computed using partial pivoting

    %Get the size of the matrix
    [m,n] = size(A);

    %Error checks
    if(m ~= n)
        fprintf("Matrix must be square!")
        L = zeros(m,n);
        U = zeros(m,n);
        P = zeros(m,n);
        return
    end

    if(det(A) == 0)
        fprintf("Matrix is singular!")
        L = zeros(m,n);
        U = zeros(m,n);
        P = zeros(m,n);
        return
    end
    
    %Finding L and U
    L = eye(m);
    U = A;
    P = eye(m);

    for k=1:m-1
        %Find the pivot value
        [pivot,ind] = max(abs(U(k:m,k)));
        %find the index of the pivot value
        ind = k + ind -1;
        
        %Swapping Rows
        U([k,ind],k:m) = U([ind,k],k:m);
        L([k,ind],1:k-1) = L([ind,k],1:k-1);
        P([k,ind],:) = P([ind,k],:);
        %Eliminating
        for l=k+1:m
            L(l,k) = U(l,k)/U(k,k);
            U(l,k:m) = U(l,k:m) - L(l,k)*U(k,k:m);
        end
    end
end