function []=plot2D(D, N_t,Put,Day)

k = 1
moneyness = D(:,7)/D(:,3);
for i = 1:N_t
    if moneyness(i,1) >= 0.85 & moneyness(i,1)<= 1.10
        money(k,1) = moneyness(i,1);
        put(k,1) = D(i,6);
        Put1(k,1) = Put(i,1);
        k = k+1;
    end
end

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
a = plot( money, put,'-o');
hold on
b = plot( money, Put1,'-ro');
%datetick('x','yyyy');
box off; grid on;
ylabel('Put Price in US Dollars')
xlabel('Moneyness');
title(strcat('S&P 500 Put Options on ', Day));
legend('Market Price','BLS model-implied Price')
%print(f,'-dpng','-r200','figures/1B');
%close(f);