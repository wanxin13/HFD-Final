function [CI_lower,CI_upper] = getCI(TV,rc, n, T)
% getCI computes the 95% confidence interval for the integrated
%       variance based on truncated variance
%
% INPUT:
%  rc: vector of doubles, diffusive returns
%  n: intenger, number of returns in a day
%  T: integer, number of days
%
% OUTPUT:
%  CI: vector of doubles, confidence interval for each day
%

% Initialize output
CI_lower = zeros(T, 1);
CI_upper = zeros(T, 1);
V = zeros(T, 1);

%Calculate CI
for d = 0: T-1
    for i = 1:n
        V(d+1,1)= V(d+1,1)+ (2/3)*(rc(d*n+i,1))^4;
    end
    CI_lower(d+1,1) = TV(d+1,1)-1.96*sqrt(V(d+1,1));
    CI_upper(d+1,1) = TV(d+1,1)+1.96*sqrt(V(d+1,1));
end