# Bezier Curves Shortest Path

This project finds the shortest path of a sequence of bezier curves, with starting and ending fixed point, with optimization using Matlab. The [example.m](https://github.com/squaresun/BezierCurveShortestPath/blob/master/example.m) uses my own implementation of [Genetic Algorithm](https://en.wikipedia.org/wiki/Genetic_algorithm) to find the shortest path. You can also apply other optimization method, from Matlab or your implemented, on this case.

[[https://github.com/squaresun/BezierCurveShortestPath/wiki/Result.png]]

## Folder Structure

### createBeziers.m

Creates bezier curve function handles with provided control points.

This method provides encapsulation of control points when bezier curve evaluation.

Example:
```=
beziers = createBeziers(inJson.curves);
beziers{1}(0.3) % return evaluated point of curve1 with t = 0.3
```

#### Input:

A cell contains control points of multiple curves. Element in cell should be a matrix, stored one point in each row.

Example:
```
ans =

  7×1 cell array

    {6×2 double}    % Curve 1 control points
    {6×2 double}    % Curve 2 control points
    {6×2 double}    % Curve 3 control points
    {6×2 double}    % Curve 4 control points
    {6×2 double}    % Curve 5 control points
    {6×2 double}    % Curve 6 control points
    {6×2 double}    % Curve 7 control points
```

#### Output:

A cell as the example below:

```
beziers =

  1×7 cell array

    {@(t)evalBezier(p,t)}    {@(t)evalBezier(p,t)}    {@(t)evalBezier(p,t)}    {@(t)evalBezier(p,t)}    {@(t)evalBezier(p,t)}    {@(t)evalBezier(p,t)}    {@(t)evalBezier(p,t)}
```

### createFitnessFunc.m

Creates fitness function, i.e. total distance between all bezier curves from start to end point, with given vector, t.

This method provides encapsulation of bezier curves and points when evaluation.

Example:
```=
f = createFitnessFunc(beziers, inJson.a, inJson.b);
f([0.5 0.5 0.5 0.5 0.5 0.5 0.5]) % return the total path distance between beziers from a to b
```

#### Input:

1. a cell contains bezier curves
    ```
    beziers =

      1×7 cell array

        {@(t)evalBezier(p,t)}    {@(t)evalBezier(p,t)}    {@(t)evalBezier(p,t)}    {@(t)evalBezier(p,t)}    {@(t)evalBezier(p,t)}    {@(t)evalBezier(p,t)}    {@(t)evalBezier(p,t)}
    ```
2. starting point
    ```
    ans =

        0.0500    1.0000
    ```
3. ending point
    ```
    ans =

        1.8500    0.5000
    ```

#### Output:

A fitness function handle which takes a vector, t, as parameter.

```
f =

  function_handle with value:

    @(t)beziersDistance(beziers,a,b,t)
```

### normT.m

Normalize a number in range [0, 1]

#### Input:

A number, t.

#### Output:

A normalized number in range [0, 1]

### plotBezier.m

Plot a bezier curve (with 100 line segments).

#### Input:

A bezier curve function handle.
```
ans =

  function_handle with value:

    @(t)evalBezier(p,t)
```

#### Output:

Plot bezier curve on graph.

### input.json

Stores:
1. bezier curves' control points
2. starting point
3. ending point

