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

f = createFitnessFunc(beziers);

result = ga(f, 2);

result = normT(result);

plot(beziers{1}(result(1))(1),beziers{1}(result(1))(2),'ro','MarkerSize',10,'MarkerFaceColor','r');
plot(beziers{2}(result(2))(1),beziers{2}(result(2))(2),'ro','MarkerSize',10,'MarkerFaceColor','r');

curvesToJson(inJson, 'output.json');

title(['7 Bezier curve with 7 control points']);
axis([0 1 0 1]);
