function [] = plotBezier(bez)

t = linspace(0,1,100);

p = bez(t);

plot(p(:,1),p(:,2),'b-','LineWidth',2);