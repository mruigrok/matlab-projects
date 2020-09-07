function x = lu_solve(L, U, b)
%Solves LUx=b by solving Ly=b and then Ux=y. 
%L is unit lower triangular , U is upper triangular
%b is permuted by P*b

 %y = inv(L)*b;
 %x = inv(U)*y;

    [m,n] = size(L);
    y = zeros(m,1);

    y(1) = b(1)/L(1,1);
    for i=2:m
        y(i)= -L(i,1)*y(1);
          for k=2:i-1
              y(i)= y(i) - L(i,k)*y(k);
          end;
          y(i)=(b(i)+y(i))/L(i,i);
    end;

    % Now we use this y to solve Ux = y
    x=zeros(m,1);
    x(m)=y(m)/U(m,m);
    i=m-1;
    q=0;
    while  (i ~= 0)
      x(i)= -U(i,m)*x(m);
       q=i+1;
          while (q~=m)
              x(i)=x(i)-U(i,q)*x(q);
              q=q+1;
          end;
        x(i)=(y(i)+x(i))/U(i,i);
        i=i-1;
    end;

end
