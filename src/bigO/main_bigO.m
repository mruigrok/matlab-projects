close all; clear all;
%Matlab's multiplication
[am,bm,n,time] = bigOconstants(1);
N = linspace(n(1),n(end));
figure(1)
loglog(n,time,'o', N,am*N.^bm,'r--', 'MarkerFaceColor', 'r')
xlabel('N'); ylabel('CPU time')
legend('Matlab mult', sprintf('%.2e \\times N^{%.3f}', am, bm),'Location','NorthWest');
set(gca, 'FontSize', 14);
print('-depsc2', 'matlabm.eps');

%strassen.m 
figure(2)
[as,bs,n,time] = bigOconstants(2);
N = linspace(n(1),n(end));
loglog(n,time,'o',  N,as*N.^bs,'r--', 'MarkerFaceColor','r')

%strassenw.m
[aw,bw,n,time] = bigOconstants(3);
hold on
loglog(n,time,'o',  N,aw*N.^bw,'b--', 'MarkerFaceColor','b');
xlabel('N'); ylabel('CPU time')
legend('Strassen', sprintf('%.2e \\times N^{%.3f}', as, bs), ...
    'Winograd', sprintf('%.2e \\times N^{%.3f}', aw, bw),'Location', 'NorthWest');
xticks(n);
set(gca, 'FontSize', 14);
print('-depsc2', 'strassen.eps');
fprintf('                    a            b\n');
fprintf('Matlab     %.2e   %.3f  \n', am, bm);
fprintf('strassen   %.2e   %.3f  \n', as, bs);
fprintf('strassenw %.2e   %.3f  \n', aw, bw);
