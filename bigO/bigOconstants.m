function [a, b, n, time] = bigOconstants(alg) 
    % Estimates the constants in big -O notation for matrix 
    % multiplication , that is a and b in a*N^b. 
    %If alg == 1, a and b are computed for Matlab ’s * 
    %If alg == 2, a and b are computed for strassen 
    %If alg == 3, a and b are computed for strassenw 
    %n is a vector of matrix sizes and time is the corresponding 
    % computing time . 
    %E.g. if n = [100 200 300] , time (1) is the time 
    % for multiplying 100 x100 matrices .
    
    %Number of repetitions for each mutiplication
    N = 5;
    switch alg
        case 1
            fprintf("Computing for Matlab's *.....\n");
            n = [1000:100:2500];
            time = zeros(length(n), 1);
            for i = 1:length(n)
               fprintf("Matrix size %d\n", n(i));
               time(i) = 0;
               for k = 1:N
                   A = rand(n(i)); B = rand(n(i));
                   tic;
                   C = A*B;
                   done = toc;
                   time(i) = time(i) + done;
               end
               time(i) = time(i)/N;
            end
           
        case 2
            %a and b are computed for strassen
            %needs a matrix with power of 2 for matrix siz
            fprintf("Computing for strassen.....\n");
            n = 2.^[7:1:10];
            time = zeros(length(n), 1);
            for i = 1:length(n)
                %Measure the time to compute A*B with strassen
                fprintf("Matrix size %d\n", n(i));
                time(i) = 0;
                for k = 1:N
                    A = rand(n(i)); B = rand(n(i));
                    tic;
                    C = strassen(A, B);
                    done = toc;
                    time(i) = time(i) + done;
                end
                time(i) = time(i)/N;   
            end
            
        case 3
            %a and b are computed for strassenw
            %needs a matrix with power of 2 for matrix size
            fprintf("Computing for strassenw.....\n");
            n = 2.^[7:1:10];
            time = zeros(length(n), 1);
            for i = 1:length(n)
                %Measure the time to compute A*B withh strassenw
                fprintf("Matrix size %d\n", n(i));
                time(i) = 0;
                for k = 1:N
                    A = rand(n(i)); B = rand(n(i));
                    tic;
                    C = strassenw(A, B);
                    done = toc;
                    time(i) = time(i) + done;
                end
                time(i) = time(i)/N;  
            end
            
        otherwise
            fprintf("Error: incorrect value for alg entered!")
    end      
   
    %The system of equations becomes D*[x,b]' = log(time)
    %where x = log(a). Therefore a = exp(x) and b = b
    D = ones(length(n), 2);
    D(:, 2) = log(n);
    const = D\log(time);
    a = exp(const(1));
    b = const(2);
      
end