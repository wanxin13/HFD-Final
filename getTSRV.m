function  [TSRV] = getTSRV(RVsubave,Noise,n_high,T_high,kn)

for d = 1:T_high
    TSRV(d,1) = RVsubave(d,1) - (2*n_high*Noise(d,1))/kn;
end


    