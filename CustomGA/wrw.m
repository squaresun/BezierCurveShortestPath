function [S_new] = wrw(f, S)

% S_filtered = [];

% for i = 1:size(S, 1)
%     exists = false;
%     for j = 1:size(S_filtered, 1)
%         if S_filtered(j, :) == S(i, :)
%             exists = true;
%             break;
%         end
%     end
%     if exists == false
%         S_filtered(end + 1, :) = S(i, :);
%     end
% end

% S = S_filtered;

fitS = fitness(f, S);

alphaS = fitS / sum(fitS, 2);

for i = 2:size(alphaS, 2)
    alphaS(i) = alphaS(i) + alphaS(i - 1);
end

alphaS = [0 alphaS];

S_new = [];

[~, alphaIndex] = sort(fitS, 'descend');

sortedS = sortSWithFit(f, S);

for i = 1:size(S, 1)
    randomNum = rand;
    for j = 1:size(alphaS, 2) - 1
        if randomNum >= alphaS(j) && randomNum <= alphaS(j + 1)
            S_new(i, :) = sortedS(find(alphaIndex == j), :);
            break;
        end
    end
end

function [sortedS] = sortSWithFit(f, S)

fitS = fitness(f, S);

sortedFitS = sort(fitS, 'ascend');
sortedS = [];
for i = 1:size(S, 1)
    indices = find(sortedFitS == fitS(i));
    for j = 1:size(indices, 2)
        sortedS(indices(1, j), :) = S(i, :);
    end
end

% function [index] = findMat(mat, vec)

% index = -1;

% for i = 1:size(mat, 1)
%     if mat(i, :) == vec
%         index = i;
%     end
% end