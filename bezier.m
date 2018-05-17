addpath('./jsonlab/');

close all;

figure(1);
hold on; box on;
set(gca,'Fontsize',16);

inJson = (loadjson('input.json')).bezierCurves;

beziers = createBeziers(inJson.curves);

for i = 1:numel(beziers)
	plotBezier(beziers{i});
end

% fitnessFcn = @(t)distance(beziers{1}(t(1)), beziers{2}(t(2)));

% ga(fitnessFcn, 2)

curvesToJson(inJson, 'output.json');

title(['7 Bezier curve with 7 control points']);
axis([0 1 0 1]);
