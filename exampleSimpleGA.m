%% Example using SimpleGA
% Plot result path in each iteration

addpath('./jsonlab/');
addpath('./SimpleGA/');

close all;

figure(1);
hold on; box on;
set(gca,'Fontsize',16);

inJson = getfield(loadjson('input.json'), 'bezierCurves');

beziers = createBeziers(inJson.curves);

% Plot bezier curves
for i = 1:numel(beziers)
	plotBezier(beziers{i});
end

f = createFitnessFunc(beziers, inJson.a, inJson.b);

result = simpleGA(f, numel(beziers), 1000, 100, plotPath(f, beziers, inJson.a, inJson.b));

title('Genetic Algorithm');
axis([0 2 0 2]);
