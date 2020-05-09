clear all; clf;
%%%%%%%%%%%%%%%%%%%%%%%%%%
X = 8;
Y = 8;
Z = 0.15;
neurons = [X Y]; learning_rate = Z; 

%Decent: X = Y = 4, Z = 0.1
%%%%%%%%%%%%%%%%%%%%%%%%%%

%Do not change below
% get training data
[points,labels] = gettrainingdata(25);
% train
niter = 1e6;   
file = 'params.mat';
cost = netbp2(neurons, points,labels, niter, learning_rate, file);

%classify points
testpoints = getpoints(500);
categories = classifypoints(file, testpoints);

% plot cost function
figure(1)
n = length(cost);
semilogy(cost,'k', 'LineWidth', 1);
xlabel('iteration')
ylabel('cost');
title(sprintf('learning rate %g', learning_rate));
set(gca,'FontSize', 14);
print('-depsc2', 'learning_rate.eps');

%plot points
figure(2)
plotpoints(points,labels,testpoints,categories,neurons,learning_rate);
print('-depsc2', 'classify.eps');


