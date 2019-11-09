function TV = getTV(rc, n, T)
% getTV computes the realized truncated estimator for the integrated
%       variance of a day, day-by-day
%
% INPUT:
%  rc: vector of doubles, diffusive returns
%  n: intenger, number of returns in a day
%  T: integer, number of days
%
% OUTPUT:
%  TV: vector of doubles, truncated variance for each day
%

% Initialize output
TV = zeros(T, 1);

%Calculate TV
for d = 0: T-1
    for i = 1:n
        TV(d+1,1)= TV(d+1,1)+ (abs(rc(d*n+i,1)))^2;
    end
end