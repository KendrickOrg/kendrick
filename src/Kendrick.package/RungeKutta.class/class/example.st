as yet unclassified
example
"self example"

|t0 ty0 t1 rk1 rk2 diag functionAsModel f|
t0 := -5.
ty0 := TimeSpace time: t0 space: 1.
t1 := 5.

rk1 := RungeKutta block: [:t :y | -15 * y].
rk1 from: ty0 to: t1 accuracy: 0.000001.

rk2 := RungeKutta block: [:t :y  | -15 * y].
rk2 from: ty0 to: t1 steps: (1.275 * rk1 size) asInteger. 

f :=  [:t | rk2 space: t].
functionAsModel := (t0 to:t1 by:0.1) collect:[:each | f value:each]. 
diag := ESDiagramRenderer new.
(diag lineDiagram)
	y: #yourself;
	yAxisLabel: 'F(X)';
	rotatedLabels: true;
	regularAxis;
	defaultColor: Color green;
	models: functionAsModel.
diag open
