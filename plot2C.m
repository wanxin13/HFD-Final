function []=plot2C(D, N_t,Day)

k = 1
moneyness = D(:,7)/D(:,3);
for i = 1:N_t
    if moneyness(i,1) >= 0.85 & moneyness(i,1)<= 1.10
        money(k,1) = moneyness(i,1);
        put(k,1) = D(i,6);
        k = k+1
    end
end

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
plot( money, put,'-o');
%datetick('x','yyyy');
box off; grid on;
ylabel('Put Price in US Dollars')
xlabel('Moneyness');
title(strcat('S&P 500 Put Options on ', Day));
%print(f,'-dpng','-r200','figures/1B');
%close(f);