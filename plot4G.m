function []=plot4G(RV_c,TSRV,rDates_high,n_high,T_high,stockname)

RV_c_year = zeros(T_high, 1);
RV_c_year = 100*sqrt(RV_c(:,1)*252);

TSRV_year = zeros(T_high, 1);
TSRV_year = 100*sqrt(TSRV(:,1)*252);


for d = 0:T_high-1
    dates( d+1,1)= rDates_high(n_high*d+1,1)
end

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);

a=plot(dates, RV_c_year, 'blue');
hold on
b=plot(dates, TSRV_year, 'red');

b.Color(4) = 0.5;

datetick('x','yyyy-mm');
box off; grid on;
ylabel('Stock RV-5min and TSRV in percentage')
xlabel('Time');
legend('RV-5min_year','TSRV_year')
title(strcat('Stock ',stockname, ' RV-5min and TSRV Comparison'));
%print(f,'-dpng','-r200','figures/2B');
%close(f);