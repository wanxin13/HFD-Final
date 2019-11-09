function [RV_c] = getRVcoarse(n_high,kn,N_high,X,T)

RV_c = zeros(T,1)
for d = 1:T    
    for i = 1:(n_high/kn)
        RV_c(d,1)= RV_c(d,1)+ (X((d-1)*N_high+i*kn+1,1)-X((d-1)*N_high+(i-1)*kn+1,1))^2;
    end
end