function [RVSIG,RVSIG2] = getRVSignature(n,X,kn_max,T,N_high)
% getRVSIG computes the realized variance estimator for different frequency
%

% Initialize output
RVSIG = zeros(T,kn_max);

%Calculate RVSIG
for d = 1:T
    for kn = 1: kn_max
        for i = 1:(n/kn)
            RVSIG(d,kn)= RVSIG(d,kn)+ (X((d-1)*N_high+i*kn+1,1)-X((d-1)*N_high+(i-1)*kn+1,1))^2;
        end
    end
end

RVSIG2 = zeros(kn_max,1)
for kn = 1: kn_max
    for d = 1:T
        RVSIG2(kn,1) = RVSIG2(kn,1) + RVSIG(d,kn);
    end
    RVSIG2(kn,1) = RVSIG2(kn,1)/T;
end