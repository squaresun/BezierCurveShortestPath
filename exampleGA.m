%% Example using Matlab's GA algorithm

addpath('./jsonlab/');

close all;

figure(1);
hold on; box on;
set(gca,'Fontsize',16);

% Read input json
inJson = getfield(loadjson('input.json'), 'bezierCurves');

% Turns all collections of control points into beziers
beziers = createBeziers(inJson.curves);

% Plot bezier curves
for i = 1:numel(beziers)
	plotBezier(beziers{i});
end

% f is a function handle of fitness function
f = createFitnessFunc(beziers, inJson.a, inJson.b);

% Using Matlab's Genetic Algorithm
result = ga(f, numel(beziers), [], [], [], [], zeros(1, numel(beziers)), ones(1, numel(beziers)));

% Plot final result path
pts = [];
pts(1, :) = inJson.a;
for i = 1:numel(beziers)
    pts(i + 1, :) = beziers{i}(result(i));
end
pts(2 + numel(beziers), :) = inJson.b;

plot(pts(:,1),pts(:,2),'k-','LineWidth',2);
plot(pts(:, 1),pts(:, 2),'ro','MarkerSize',10,'MarkerFaceColor','r');

title('Shortest Path');
axis([0 2 0 2]);
