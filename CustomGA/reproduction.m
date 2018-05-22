function [S_new] = reproduction(S, n)

S_new = [];

randOrder = randperm(size(S, 1));

for i = 1:2:size(S, 1) - 1
    a = floor(S(randOrder(i), :).*(2^n - 1));
    b = floor(S(randOrder(i + 1), :).*(2^n - 1));
    aBin = de2bi(a);
    bBin = de2bi(b);
    while size(aBin) < 10
        aBin = [zeros(size(S, 2), 1) aBin];
    end
    while size(bBin) < 10
        bBin = [zeros(size(S, 2), 1) bBin];
    end
    aBin = reshape(aBin', [1 (size(S, 2) * n)]);
    bBin = reshape(bBin', [1 (size(S, 2) * n)]);

    crossIndex = min(floor(rand * size(aBin, 2)) + 1, size(aBin, 2));
    
    tmp = aBin(1, crossIndex:end);
    aBin(1, crossIndex:end) = bBin(1, crossIndex:end);
    bBin(1, crossIndex:end) = tmp;

    for j = 1:n:size(aBin, 2)
        S_new(i, (j - 1) / n + 1) = bi2de(aBin(1, j:(j+n-1))) / (2^n - 1);
        S_new(i + 1, (j - 1) / n + 1) = bi2de(bBin(1, j:(j+n-1))) / (2^n - 1);
    end
end
