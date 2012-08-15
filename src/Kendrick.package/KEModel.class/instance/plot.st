as yet unclassified
plot

|diag|
diag := ESDiagramRenderer new.
	(diag lineDiagram)
		y: #second;		
		yAxisLabel: 'Infected';
		xAxisLabel: 'Time';
		defaultColor: Color blue;
		width: 800;
		height: 400;
		regularAxis ;
		models: result.
^ diag open