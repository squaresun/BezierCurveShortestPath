function [f] = createFitnessFunc(beziers)

f = @(t) norm(diff(rearrangeMat(cell2mat(cellfun(@(bez, i) bez(t(i)), beziers, num2cell(1:length(t)), 'UniformOutput', false)))));

function [pts] = rearrangeMat(row)

pts = [];
for i = 1:2:length(row)
    pts((i + 1) / 2, 1) = row(i);
    pts((i + 1) / 2, 2) = row(i + 1);
end