function [Call, Put] = BLScallput(S, K, r, T, sig, q)
% Computes the price of Call and Put options implied by the Black-Scholes model
%
% Args:
%     S (float): current stock price in dollars
%     K (float): strike price in dollars
%     r (float): interest rate as decimal number, e.g., 1.75% => r=0.0175
%     T (float): expiration in years, e.g., 38 days => T = 38/365
%     sig (float): standard deviation in decimals
%     q (float): dividend yield as decimal number, e.g., 2.31% => q=0.0231
%
% Returns:
%     Call (float): fair value of call under BLS
%     Put (float): fair value of put under BLS

A = 1/(sig*sqrt(T));
B = log(S/K) + (r-q + .5*(sig^2))*T;
%
d1 = A*B;
d2 = d1 - sig*sqrt(T);
%
Call = S*exp(-q*T)*normcdf(d1) - exp(-r*T)*K*normcdf(d2);
Put = Call + exp(-r*T)*K - exp(-q*T)*S;