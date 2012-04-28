as yet unclassified
plot

|diag|

diag := ESDiagramRenderer new.
	(diag lineDiagram)
		y: #second;
		identifier: #first;
		yAxisLabel: 'Infected';
		xAxisLabel:'Time';
	"	smallObjects;"
		width: 1000;
		height: 1000;
		regularAxis;
		rotatedLabels: true;
		models: result.
^ diag open