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

fitnessFcn = @(t)norm(beziers{1}(t(1)) - beziers{2}(t(2)));

result = ga(fitnessFcn, 2);

f = createFitnessFunc(beziers);

f([0.5 0.5])

result = normT(result);

plot(beziers{1}(result(1))(1),beziers{1}(result(1))(2),'ro','MarkerSize',10,'MarkerFaceColor','r');
plot(beziers{2}(result(2))(1),beziers{2}(result(2))(2),'ro','MarkerSize',10,'MarkerFaceColor','r');

curvesToJson(inJson, 'output.json');

title(['7 Bezier curve with 7 control points']);
axis([0 1 0 1]);
