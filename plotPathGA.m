function [plotFunc] = plotPathGA(f, beziers, a, b)

global PLOTTERS;
PLOTTERS = [];

plotFunc = @(S) plotting(beziers, a, b, mostFit(f, S));

function [plotters] = plotting(beziers, a, b, result)

global PLOTTERS;
plotters = PLOTTERS;

for i = 1:size(plotters, 2)
    set(plotters(i), 'Visible', 'off');
end

pts = [];
pts(1, :) = a;
for i = 1:numel(beziers)
    pts(i + 1, :) = beziers{i}(result(i));
end
pts(2 + numel(beziers), :) = b;

plotters(1) = plot(pts(:, 1),pts(:, 2),'k-','LineWidth',2);
plotters(2) = plot(pts(:, 1),pts(:, 2),'ro','MarkerSize',10,'MarkerFaceColor','r');

PLOTTERS = plotters;

pause(0.1);
