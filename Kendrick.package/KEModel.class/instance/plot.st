as yet unclassified
plot

|diag|

diag := ESDiagramRenderer new.
	(diag scatterplot)
		y: #second;
		x: #first;
		smallObjects;
		width: 1000;
		height: 300;
		valueAxis;
		rotatedLabels: true;
		models: result.
^ diag open