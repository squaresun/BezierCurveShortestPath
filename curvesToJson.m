function [fid] = curvesToJson(outJson, filename)

for i = 1:numel(outJson.curves)
    curveBuf = outJson.curves{i};
    if curveBuf(1, :) == curveBuf(size(curveBuf, 1), :)
        outJson.curves{i} = curveBuf(1:size(curveBuf, 1) - 1, :);
    end
end

curvesJson=savejson('bezierCurves', outJson);
fid = fopen(filename,'wt');
fprintf(fid, curvesJson);
fclose(fid);