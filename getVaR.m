function [VaR] = getVaR(V,TV)

q_1 = -2.326
Q = q_1*V*sqrt(TV);
VaR = abs(Q)