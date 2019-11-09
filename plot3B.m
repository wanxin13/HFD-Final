function []=plot3B(K, S,Put_BS,Put_HW)

k = 1
moneyness = K(:,1)/S;
for i = 1:6
    if moneyness(i,1) >= 0.85 & moneyness(i,1)<= 1.10
        money(k,1) = moneyness(i,1);
        put(k,1) = Put_BS(i,1);
        Put1(k,1) = Put_HW(i,1);
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
title(strcat('Two Models Pricing 90-Day Put Options'));
legend('Black-Scholes implied Price','Hull-White implied Price')
%print(f,'-dpng','-r200','figures/1B');
%close(f);