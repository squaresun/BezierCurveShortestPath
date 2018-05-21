addpath('./jsonlab/');
addpath('./CustomGA/');

inJson = getfield(loadjson('input.json'), 'bezierCurves');

beziers = createBeziers(inJson.curves);
f = createFitnessFunc(beziers, inJson.a, inJson.b);
customGA(f, numel(beziers), 10);