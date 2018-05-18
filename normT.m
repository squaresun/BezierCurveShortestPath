function [result] = normT(t)

result = arrayfun(@(n) mod(n, 1), t);