function [fitS] = fitness(f, S)

fitS = [];
for i = 1:size(S, 1)
    fitS(i) = f(S(i, :));
end