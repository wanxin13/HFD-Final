function []=plot4E(AveContri, kn_max,stockname)

kn = [1/12:1/12:kn_max/12]

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
plot( kn, AveContri, 'ro');
%datetick('x','yyyy');
box off; grid on;
ylabel('Averaged Contribution of Noise in percentage')
xlabel('Sampling Frequency in Minutes');
title(strcat('Stock ',stockname,'Averaged Contribution of Noise'));
%print(f,'-dpng','-r200','figures/1B');
%close(f);