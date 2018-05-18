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

f = createFitnessFunc(beziers, inJson.a, inJson.b);

result = normT(ga(f, numel(beziers)));

pts = [];
pts(1, :) = inJson.a;
for i = 1:numel(beziers)
	pts(i + 1, 1) = beziers{i}(result(i))(1);
	pts(i + 1, 2) = beziers{i}(result(i))(2);
end
pts(2 + numel(beziers), :) = inJson.b;

plotPath(pts);

curvesToJson(inJson, 'output.json');

title(['Genetic Algorithm']);
axis([0 2 0 2]);
