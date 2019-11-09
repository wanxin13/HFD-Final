function [RV_s] = getSubRV(T,kn,n_high,X,N_high)

RV_s = zeros(T,kn)
    
for d = 1:T    
    for i = 1:(n_high/kn)
        RV_s(d,1)= RV_s(d,1)+ (X((d-1)*N_high+i*kn+1,1)-X((d-1)*N_high+(i-1)*kn+1,1))^2;
    end
end


for j = 2:kn
    for d = 1:T    
        for i = 1:(n_high-j+1)/kn
            RV_s(d,j)= RV_s(d,j)+ (X((d-1)*N_high+i*kn+1+j-1,1)-X((d-1)*N_high+(i-1)*kn+1+j-1,1))^2;
        end
     end
end