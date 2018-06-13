%% Example using SimpleGA
% Plot result path in each iteration

addpath('./jsonlab/');
addpath('./SimpleGA/');

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

% Using my simple implementation of Genetic Algorithm
% plotPath() would be fired every iteration
result = simpleGA(f, numel(beziers), 1000, 100, plotPath(f, beziers, inJson.a, inJson.b));

title('Shortest Path');
axis([0 2 0 2]);
