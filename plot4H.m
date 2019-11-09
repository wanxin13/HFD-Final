function []=plot4H(RVSIG2,TSRVSIG2, kn_max,stockname)

TSRVSIG_year = 100*sqrt(TSRVSIG2(:,1)*252);
RVSIG_year = 100*sqrt(RVSIG2(:,1)*252);
kn = [1/12:1/12:kn_max/12]

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);

a = plot( kn, RVSIG_year, 'ro');
hold on
b = plot( kn, TSRVSIG_year, 'bo');

%datetick('x','yyyy');
box off; grid on;
ylabel('Stock Averaged Annualized Volatility')
xlabel('Sampling Frequency in Minutes');
title(strcat('Stock ',stockname,' Volatility Signature'));
legend('Annualized RV','Annualized TSRV')
%print(f,'-dpng','-r200','figures/1B');
%close(f);