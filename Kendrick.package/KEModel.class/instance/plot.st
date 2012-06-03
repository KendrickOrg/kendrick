as yet unclassified
plot

|diag|
diag := ESDiagramRenderer new.
	(diag lineDiagram)
		y: #second;
		identifier: #first;
		yAxisLabel: 'Infected';
		xAxisLabel: 'Time';
		defaultColor: Color blue;
		width: 800;
		height: 400;
		regularAxis ;
		models: result.
^ diag open