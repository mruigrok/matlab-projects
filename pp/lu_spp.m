function [L U P] = lu_spp(A)
    %[L,U,P] = lu_spp(A) computes a unit lower triangular matrix L, 
    %an upper triangular matrix U, and a permutation matrix P such that 
    %P*A = L*U. 
    %The LU factorization is computed using scaled partial pivoting

    %Get the size of the matrix
    [m,n] = size(A);

    %Error checks
    if(m ~= n)
        printf("Matrix must be square!")
        L = zeros(m,n);
        U = zeros(m,n);
        P = zeros(m,n);
        return
    end

    if(det(A) == 0)
       printf("Matrix is singular!")
       L = zeros(m,n);
       U = zeros(m,n);
       P = zeros(m,n);
       return
    end
    
    %Finding L and U
    L = eye(m);
    U = A;
    P = eye(m);
    
    %Getting the largest elements in each row
    max_vec = max(abs(U(:,:)),[],2);
    for k=1:m-1
        %Find the ratio vector
        ratio_vec = U(k:end,k)./max_vec(k:end);
        [val, ind] = max(abs(ratio_vec));     
        
        %Ensure it is a row that hasn't been eliminated
        ind = ind + k - 1;
        
        %Swap out the rows
        max_vec([k,ind]) = max_vec([ind,k]);
        U([k,ind],k:m) = U([ind,k],k:m);
        L([k,ind],1:k-1) = L([ind,k],1:k-1);
        P([k,ind],:) = P([ind,k],:);
      
        %Eliminate
        for l=k+1:m
            L(l,k) = U(l,k)/U(k,k);
            U(l,k:m) = U(l,k:m) - L(l,k)*U(k,k:m);
        end
    end
end
