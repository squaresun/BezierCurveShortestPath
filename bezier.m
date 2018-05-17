function [beziers] = createBeziers(curves)

beziers = {};
for i = 1:numel(curves)
    p = curves{i};
    if p(size(p, 1), :) ~= p(1, :)
        newIndex = size(p, 1) + 1;
        p(newIndex, 1) = p(1, 1);
        p(newIndex, 2) = p(1, 2);
    end
    beziers{i} = @(t)evalBezier(p, t);
end

function [val] = evalBezier(p,t)

t = normT(t);

n = size(p,1);
m = length(t);
T = zeros(n,n);
val = zeros(m,2);
X(:,1) = p(:,1);
Y(:,1) = p(:,2);

for j = 1:m
    for i = 2:n
        X(i:n,i) = (1-t(j))*X(i-1:n-1,i-1) + t(j)*X(i:n,i-1);
        Y(i:n,i) = (1-t(j))*Y(i-1:n-1,i-1) + t(j)*Y(i:n,i-1);
    end
    val(j,1) = X(n,n);
    val(j,2) = Y(n,n);
end

function [result] = normT(t)

result = t;

for i = 1:numel(result)
    while result(i) < 0
        result(i) += 1;
    end
    while result(i) > 1
        result(i) -= 1;
    end
end

function [] = plotBezier(bez)

t = linspace(0,1,100);

p = bez(t);

plot(p(:,1),p(:,2),'b-','LineWidth',2);
    