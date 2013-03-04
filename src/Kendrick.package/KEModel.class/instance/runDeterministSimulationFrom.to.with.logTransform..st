as yet unclassified
runDeterministSimulationFrom: x0 to: xn with: step logTransform: lo

| solverRK results diag xValue nbIteration |
solverRK := RungeKuttaSolver new.
solverRK finalValueOfX: xn.
solverRK initialValueOfX: x0.
solverRK stepSize: step.

results := solverRK solver: self.
nbIteration := ((xn - x0)/step) rounded.
"Get log10 of yy"
lo ifTrue:[
	1 to: nbIteration do:[:j|
		(results at: j) at: 2 put: (((results at: j) at: 2) log).
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
		models: results.
	^ diag open
	


