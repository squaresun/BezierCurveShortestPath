addpath('./jsonlab/');

close all;
nplot = 100;

figure(1);
hold on; box on;
set(gca,'Fontsize',16);
t = linspace(0,1,nplot);

data2json=pi;
jsonContent=savejson('bye',data2json);
fid = fopen('hello.json','wt');
fprintf(fid, jsonContent);
fclose(fid);
bye = (loadjson('hello.json'))
disp(bye.bye + 1)
for i = 1:7

	p = rand(6, 2);

	p(7, 1) = p(1, 1);
	p(7, 2) = p(1, 2);


	[X,Y,p_bez] = evalBezier(p,t);
	plot(p_bez(:,1),p_bez(:,2),'b-','LineWidth',4);

end

title(['7 Bezier curve with 7 control points']);
axis([0 1 0 1]);
