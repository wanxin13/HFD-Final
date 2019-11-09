function []=plot4B(RVSIG2, kn_max,stockname)

RVSIG_year = 100*sqrt(RVSIG2(:,1)*252);
kn = [1/12:1/12:kn_max/12]

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
plot( kn, RVSIG_year, 'ro');
%datetick('x','yyyy');
box off; grid on;
ylabel('Stock Averaged Annualized RV')
xlabel('Sampling Frequency in Minutes');
title(strcat('Stock ',stockname,' Volatility Signature'));
%print(f,'-dpng','-r200','figures/1B');
%close(f);