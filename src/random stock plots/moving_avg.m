close all; clear;
%Get closing prices and plot moving average
stock = get_yahoo_stockdata3('msft', '1-Jan-2018');
closing_prices = stock.closePrice(201:1:end);
display(stock.dataSource);


%(a) 200 day average

%Get the points, first 200 day average is at day 200
avg = zeros(length(stock.closePrice)-200, 1);
for i = 1:length(avg)
    avg(i) = sum(stock.closePrice(i:1:200+i));
end

%Find the average on day 'i' y dividing all by 200
avg = avg./200;
x = 1:length(avg);
plot(x, avg);
hold on
plot(x, closing_prices);
xlabel("Day");
ylabel("Closing Price");
xlim([0,347]);
title("Microsoft - msft");
legend("200 day average", "Stock Price", "Location", "Northwest");
hold off

%(b)Compute with linear least squares

yl = zeros(length(stock.closePrice) - 200, 1);
for i = 1:length(yl)
   y = stock.closePrice(i:1:199+i);
   A = [(i:1:199+i)', ones(200,1)];
   x = A\y;
   yl(i) = x(1)*(200+i) + x(2);
end

x = 1:length(yl);
plot(x,yl);
hold on
plot(x,closing_prices);
xlim([0 347]);
xlabel("Day");
ylabel("Closing Price");
title("Microsoft - msft");
legend("Linear Fit", "Stock Price", "Location", "Northwest");
hold off

%(c) Quadratic least squares

yq = zeros(length(stock.closePrice)-200,1);

for i = 1:length(yq)
    y = stock.closePrice(i:1:199+i);
    A = [(i:1:199+i).^2', (i:1:199+i)', ones(200,1)];
    x = A\y;
    yq(i) = x(1)*(200+i)^2 + x(2)*(200+i) + x(3);
end

%plot
x = 1:length(yq);
plot(x,yq);
hold on
plot(x,closing_prices);
xlim([0 347]);
ylim([90,190]);
xlabel("Day");
ylabel("Closing Price");
title("Microsoft - msft");
legend("Quadratic Fit", "Stock Price", "Location", "Northwest");
hold off

%(d) Cubic least squares

yc = zeros(length(stock.closePrice)-200,1);
yc2 = zeros(length(stock.closePrice)-200,1); 

for i = 1:length(yc)
    y = stock.closePrice(i:1:199+i);
    A = [(i:1:199+i).^3',(i:1:199+i).^2', (i:1:199+i)', ones(200,1)];
    x = A\y;
    yc(i) = x(1)*(200+i)^3 + x(2)*(200+i)^2 + x(3)*(200+i) + x(4);
end

%plot
x = 1:length(yc);
plot(x,yc);
hold on
plot(x,closing_prices);
xlim([0 347]);
ylim([90,190]);
xlabel("Day");
ylabel("Closing Price");
title("Microsoft - msft");
legend("Cubic Fit", "Stock Price", "Location", "Northwest");
hold off

