function [sigma] = SimVolatility(V,n)

for i = 1:n
    Vo(i,1) = log(V)-(1.20)^2/2 +1.20*normrnd(0,1);
    Vo(i,1) = exp(Vo(i,1));
end

sigma(:,1) = Vo(:,1)/100;