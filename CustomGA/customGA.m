function [S] = customGA(f, nvars, ngen, plotFunc)

S = rand(ngen, nvars);

S_old = zeros(size(S));

plotter = [];

for retry = 1:100
    while norm(diff(fitness(f, S) - fitness(f, S_old))) > 0.001
        S_old = S;
        
        S = wrw(f, S);

        S = reproduction(S, 10);
        
        S = mutation(S, 10);

        fitS = mostFit(f, S);

        for i = 1:size(plotter, 2)
            set(plotter(i), 'Visible', 'off');
        end

        plotter = plotFunc(fitS);
    end
end

function [mostFit] = mostFit(f, S)

fitMat = fitness(f, S);

[~, index] = sort(fitMat, 'ascend');

mostFit = S(index(1), :);