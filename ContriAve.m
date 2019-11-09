function [AveContri] = ContriAve(T,kn_max,Noise,n_high,RVSIG)

Contri = zeros(T,kn_max);
for d = 1:T
    for kn = 1:kn_max
        Contri(d,kn) = (2*n_high*Noise(d,1))/(kn*RVSIG(d,kn));
    end
end

AveContri = zeros(kn_max,1)
for kn = 1: kn_max
    for d = 1:T
        AveContri(kn,1) = AveContri(kn,1) + Contri(d,kn);
    end
    AveContri(kn,1) = 100*AveContri(kn,1)/T;
end