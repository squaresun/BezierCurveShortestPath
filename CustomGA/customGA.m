function [S] = customGA(f, nvars, ngen, plotFunc)

S = rand(ngen, nvars);

S_old = zeros(size(S));

plotter = [];

retry = 1;

while retry < 100% && f(mostFit(f, S)) - f(mostFit(f, S_old)) < -0.001
    f(mostFit(f, S))

    S_old = S;

    S = wrw(f, S);

    S = reproduction(S, 10);

    S = mutation(S, 10);

    fitS = mostFit(f, S);

    for i = 1:size(plotter, 2)
        set(plotter(i), 'Visible', 'off');
    end

    plotter = plotFunc(fitS);

%     f(mostFit(f, S))

    retry = retry + 1;
end

retry

S = S_old;

function [mostFitS] = mostFit(f, S)

fitMat = fitness(f, S);

[~, index] = sort(fitMat, 'ascend');

mostFitS = S(index(1), :);