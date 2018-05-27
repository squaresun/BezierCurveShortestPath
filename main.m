addpath('./jsonlab/');
addpath('./SimpleGA/');

close all;

figure(1);
hold on; box on;
set(gca,'Fontsize',16);

inJson = getfield(loadjson('input.json'), 'bezierCurves');

beziers = createBeziers(inJson.curves);

for i = 1:numel(beziers)
	plotBezier(beziers{i});
end

f = createFitnessFunc(beziers, inJson.a, inJson.b);

% result = ga(f, numel(beziers), [], [], [], [], zeros(1, numel(beziers)), ones(1, numel(beziers)))
result = simpleGA(f, numel(beziers), 1000, 100, plotPathGA(f, beziers, inJson.a, inJson.b));

% pts = [];
% pts(1, :) = inJson.a;
% for i = 1:numel(beziers)
%     pts(i + 1, :) = beziers{i}(result(i));
% end
% pts(2 + numel(beziers), :) = inJson.b;

% plot(pts(:,1),pts(:,2),'k-','LineWidth',2);
% plot(pts(:, 1),pts(:, 2),'ro','MarkerSize',10,'MarkerFaceColor','r');

title('Genetic Algorithm');
axis([0 2 0 2]);
