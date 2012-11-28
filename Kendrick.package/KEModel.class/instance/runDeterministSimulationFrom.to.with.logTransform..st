as yet unclassified
runDeterministSimulationFrom: x0 to: xn with: step logTransform: lo

| solverRK yy diag xValue nbIteration |
solverRK := RungeKuttaSolver on/self.
solverRK finalValueOfX: xn.
solverRK initialValueOfX: x0.
solverRK stepSize: step.

yy := solverRK rk4Solve.
nbIteration := ((xn - x0)/step) rounded.
"Get log10 of yy"
(lo) ifTrue:[
	1 to: nbIteration do:[:j|
		(yy at: j) at: 2 put: (((yy at: j) at: 2) log).
		].
	].

"Draw diagram"
diag := ESDiagramRenderer new.
	(diag lineDiagram)
		y: #second;		
		"identifier: #first;"
		defaultColor: Color red;
		regularAxis;
		yAxisLabel: 'Infected';
		lineWidth: 2;
		width: 1000;
		height: 300;
		startLineAtZero;			
		models: yy.
	^ diag open
	


