function Noise = getNoise(r_high, n_high, T_high)

% Initialize output
Noise = zeros(T_high, 1);

%Calculate RV
for d = 0: T_high-1
    for i = 1:n_high
        Noise(d+1,1)= Noise(d+1,1)+ (abs(r_high(d*n_high+i,1)))^2;
    end
    Noise(d+1,1) = Noise(d+1,1)/(2*n_high);
end
    