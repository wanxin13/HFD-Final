function [HW] = HWput(S,K,r,T,V,q,n)

[sigma] = SimVolatility(V,n)

HW = 0
for i = 1:n
    [Call, Put] = BLScallput(S, K, r, T, sigma(i,1), q);
    HW = HW + Put;
end
HW = HW/1000;