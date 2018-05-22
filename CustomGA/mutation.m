function [S_new] = mutation(S, n)

S_new = [];

for i = 1:size(S, 1)
    a = floor(S(i, :).*(2^n - 1));
    aBin = de2bi(a);

    if rand < 0.001
        i1 = min(floor(rand * size(aBin, 1)) + 1, size(aBin, 1));
        i2 = min(floor(rand * size(aBin, 2)) + 1, size(aBin, 2));
        aBin(i1, i2) = mod(aBin(i1, i2) + 1, 2);
    end

    for j = 1:size(aBin, 1)
        S_new(i, j) = bi2de(aBin(j, :)) / (2^n - 1);
    end
end