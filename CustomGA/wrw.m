function [S_new] = wrw(f, S)

fitS = fitness(f, S);

alphaS = fitS / sum(fitS, 2);

for i = 2:size(alphaS, 2)
    alphaS(i) = alphaS(i) + alphaS(i - 1);
end

alphaS = [0 alphaS];

S_new = [];

[~, fitIndex] = sort(fitS, 'ascend');

for i = 1:size(fitS, 2)
    randomNum = rand;
    for j = 1:size(alphaS, 2) - 1
        if randomNum >= alphaS(j) && randomNum <=alphaS(j + 1)
            S_new(i, :) = S(find(fitIndex == j), :);
            break;
        end
    end
end