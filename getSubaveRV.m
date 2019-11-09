function [RVsubave] = getSubaveRV(T_high,RV_s,kn)

RVsubave = zeros(T_high,1);

for d = 1:T_high
    for j = 1:kn
        RVsubave(d,1) = RVsubave(d,1) + RV_s(d,j);
    end
    RVsubave(d,1) = RVsubave(d,1)/kn;
end