function [S_new] = reproduction(S, n)

S_new = [];

indices = randperm(size(S, 1));

for i = 1:2:size(S, 1) - 1
    a = floor(S(indices(i), :).*(2^n - 1));
    b = floor(S(indices(i + 1), :).*(2^n - 1));
    aBin = dec2bin(a, n);
    bBin = dec2bin(b, n);

    % aBin = reshape(aBin', [1 (size(S, 2) * n)]);
    % bBin = reshape(bBin', [1 (size(S, 2) * n)]);

    % aBin = reshape(aBin, [1 (size(S, 2) * n)]);
    % bBin = reshape(bBin, [1 (size(S, 2) * n)]);

    for j = 1:size(aBin, 1)
        crossIndex = min(floor(rand * size(aBin, 2)) + 1, size(aBin, 2));

        tmp = aBin(j, crossIndex:end);
        aBin(j, crossIndex:end) = bBin(j, crossIndex:end);
        bBin(j, crossIndex:end) = tmp;

        S_new(i, j) = bin2dec(aBin(j, :)) / (2^n - 1);
        S_new(i + 1, j) = bin2dec(bBin(j, :)) / (2^n - 1);
    end

    % crossIndex = min(floor(rand * size(aBin, 2)) + 1, size(aBin, 2));
    
    % tmp = aBin(1, crossIndex:end);
    % aBin(1, crossIndex:end) = bBin(1, crossIndex:end);
    % bBin(1, crossIndex:end) = tmp;

    % for j = 1:n:size(aBin, 2)
    %     S_new(i, (j - 1) / n + 1) = bi2de(aBin(1, j:(j+n-1))) / (2^n - 1);
    %     S_new(i + 1, (j - 1) / n + 1) = bi2de(bBin(1, j:(j+n-1))) / (2^n - 1);
    % end

    % for k = 1:size(S, 2)
    %     aTmp = [];
    %     bTmp = [];
    %     for j = 1+k:n:size(aBin, 2)
    %         aTmp((j - k - 1) / n + 1) = aBin(1, j);
    %         bTmp((j - k - 1) / n + 1) = bBin(1, j);
    %     end
    %     S_new(i, k) = bi2de(aTmp) / (2^n - 1);
    %     S_new(i + 1, k) = bi2de(bTmp) / (2^n - 1);
    % end
end

function [indices] = randOrder(n)

indices = 1:n;

crossN = min(floor(rand * n / 2) + 1, n);

for i = 1:crossN
    i1 = min(floor(rand * n) + 1, n);
    i2 = min(floor(rand * n) + 1, n);
    tmp = indices(i1);
    indices(i1) = indices(i2);
    indices(i2) = tmp;
end