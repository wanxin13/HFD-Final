function [t_present] = Identifydate(rDates,n,T,y1,m1,da1)


for d = 0:T-1
    dates( d+1,1)= rDates(n*d+1,1);
end

for d = 0:T-1
    da = day(datetime(dates(d+1,1),'ConvertFrom','datenum'));
    m = month(datetime(dates(d+1,1),'ConvertFrom','datenum'));
    y = year(datetime(dates(d+1,1),'ConvertFrom','datenum'));
    if y == y1 & m == m1 & da == da1
        t_present = d+1;
    end
end