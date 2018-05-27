function [f] = createFitnessFunc(beziers, a, b)

f = @(t) beziersDistance(beziers, a, b, t);

function [dist] = beziersDistance(beziers, a, b, t)

dist = 0;
curPoint = a;
for i = 1:numel(beziers)
    point = beziers{i}(t(i));
    dist = dist + norm(curPoint - point);
    curPoint = point;
end

dist = dist + norm(curPoint - b);