function points = getpoints(n)
% Generate data points in [0,1]x[0,1]
x = linspace(0,1,n);
y = linspace(0,1,n);
k=1;
for i = 1:n
    for j = 1:n
        points(:,k) = [x(i); y(j)];
        k = k+1;
    end
end