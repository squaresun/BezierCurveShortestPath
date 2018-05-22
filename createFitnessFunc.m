function [f] = createFitnessFunc(beziers, a, b)

f = @(t) beziersDistance(beziers, a, b, t);

function [pts] = rearrangeMat(row, a, b)

pts = [];
pts(1, :) = a(1);
for i = 1:2:length(row)
    pts((i + 1) / 2 + 1, 1) = row(i);
    pts((i + 1) / 2 + 1, 2) = row(i + 1);
end
pts(2 + length(row) / 2, :) = b(1);

function [dist] = beziersDistance(beziers, a, b, t)

dist = 0;
curPoint = a;
for i = 1:numel(beziers)
    point = beziers{i}(t(i));
    dist = dist + norm(curPoint - point);
    curPoint = point;
end

dist = dist + norm(curPoint - b);