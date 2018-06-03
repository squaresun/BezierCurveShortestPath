function [beziers] = createBeziers(curves)

beziers = cell(1, numel(curves));
for i = 1:numel(curves)
    beziers{i} = @(t)evalBezier(curves{i}, t);
end

function [val] = evalBezier(p,t)

t = normT(t);

n = size(p,1);
m = length(t);
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
