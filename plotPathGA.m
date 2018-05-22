function [plotters] = plotPathGA(beziers, a, b, result)

pts = [];
pts(1, :) = a;
for i = 1:numel(beziers)
    pts(i + 1, :) = beziers{i}(result(i));
end
pts(2 + numel(beziers), :) = b;

plotters = [];
plotters(1) = plot(pts(:,1),pts(:,2),'k-','LineWidth',2);
plotters(2) = plot(pts(:, 1),pts(:, 2),'ro','MarkerSize',10,'MarkerFaceColor','r');

pause(0.1);