function  cost = netbp2(neurons, data, labels, niter, lr, file)
%Trains a neural network with 4 layers.
%Layer 2 has 2 neurons, layer 2 has neurons(1) and 
%layer 3 has neurons(2)
%data is a matrix with two rows.  data(:,i) contains
%the (x,y) coordinates of point i.
%labels is a matrix with two rows. labels(:,i) is [1;0] 
%if data(:,i) is in category A and [0;1] if it is in category B.
%lr is learning rate
%niter is maximum number of iterations
%file is a filename where the file is created by 
%save(file, 'W2','W3','W4','b2','b3','b4');
%cost is a vector storing the value of the cost function 
%after each iteration; i.e. cost(j) is the cost at iteration j

    %%%%%%% DATA %%%%%%%%%%%
    %x = data() passed as a parameter
    x1 = data(1,:);
    x2 = data(2,:);
    %The labelled data
    y = labels;

    % Initialize weights and biases 
    rng(5000);
    W2 = 0.5*randn(neurons(1),2); W3 = 0.5*randn(neurons(2),neurons(1)); W4 = 0.5*randn(2,neurons(2));
    b2 = 0.5*randn(neurons(1),1); b3 = 0.5*randn(neurons(2),1); b4 = 0.5*randn(2,1);

    % Forward and Back propagate 
    eta = lr;                % learning rate
    Niter = niter;           % number of SG iterations 
    cost = zeros(Niter,1);   % value of cost function at each iteration
    for counter = 1:Niter
        k = randi(length(data(1,:)));   % choose a training point at random
        x = [x1(k); x2(k)];
        % Forward pass
        a2 = activate(x,W2,b2);
        a3 = activate(a2,W3,b3);
        a4 = activate(a3,W4,b4);
        % Backward pass
        delta4 = a4.*(1-a4).*(a4-y(:,k));
        delta3 = a3.*(1-a3).*(W4'*delta4);
        delta2 = a2.*(1-a2).*(W3'*delta3);
        % Gradient step
        W2 = W2 - eta*delta2*x';
        W3 = W3 - eta*delta3*a2';
        W4 = W4 - eta*delta4*a3';
        b2 = b2 - eta*delta2;
        b3 = b3 - eta*delta3;
        b4 = b4 - eta*delta4;
        % Monitor progress
        newcost = costfun(W2,W3,W4,b2,b3,b4)   % display cost to screen
        cost(counter) = newcost;
    end
    % Show decay of cost function  
    save costvec
    semilogy([1:1e4:Niter], cost(1:1e4:Niter))

    save(file, 'W2','W3','W4','b2','b3','b4');

    function costval = costfun(W2,W3,W4,b2,b3,b4)
         costvec = zeros(length(x1),1); 
         for i = 1:length(costvec)
             x =[x1(i);x2(i)];
             a2 = activate(x,W2,b2);
             a3 = activate(a2,W3,b3);
             a4 = activate(a3,W4,b4);
             costvec(i) = norm(y(:,i) - a4,2);
         end
         costval = norm(costvec,2)^2;
      end % of nested function

end


