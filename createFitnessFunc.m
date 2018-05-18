function [f] = createFitnessFunc(beziers, a, b)

f = @(t) norm(diff(rearrangeMat(cell2mat(cellfun(@(bez, i) bez(t(i)), beziers, num2cell(1:length(t)), 'UniformOutput', false)), a, b)));

function [pts] = rearrangeMat(row, a, b)

pts = [];
pts(1, :) = a(1);
for i = 1:2:length(row)
    pts((i + 1) / 2 + 1, 1) = row(i);
    pts((i + 1) / 2 + 1, 2) = row(i + 1);
end
pts(2 + length(row) / 2, :) = b(1);