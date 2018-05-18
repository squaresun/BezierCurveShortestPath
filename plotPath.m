function [] = plotPath(pts)

plot(pts(:,1),pts(:,2),'k-','LineWidth',2);

for i = 1:size(pts)
    plot(pts(i, 1),pts(i, 2),'ro','MarkerSize',10,'MarkerFaceColor','r');
end