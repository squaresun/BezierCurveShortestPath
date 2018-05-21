function [S] = customGA(f, nvars, ngen)

S = rand(ngen, nvars);
wrw(f, S, ngen);

for retry = 1:1000
    % while norm(fitS .- fitS_old) < 0.001

    % end
end