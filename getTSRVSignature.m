function [TSRVSIG2] = getTSRVSignature(kn_max,T_high,TSRVSIG)

TSRVSIG2 = zeros(kn_max,1)
for kn = 1: kn_max
    for d = 1:T_high
        TSRVSIG2(kn,1) = TSRVSIG2(kn,1) + TSRVSIG(d,kn);
    end
    TSRVSIG2(kn,1) = TSRVSIG2(kn,1)/T_high;
end