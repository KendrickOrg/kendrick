as yet unclassified
runDeterministeSimulationFrom: x0 To: xn With: step

| solverRK yy diag xValue |
solverRK := RungeKuttaSolver new.
solverRK finalValueOfX: xn.
solverRK initialValueOfX: x0.
solverRK stepSize: step.

yy := solverRK solver: self.
"Dessiner le diagramme"
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
	


