as yet unclassified
plot
	| diag f |
	f := [ :x | self atIndex: x ].
	diag := ESDiagramRenderer new.
	diag lineDiagram
		y: f;
		defaultColor: Color blue;
		yAxisLabel: 'Number of individuals';
		regularAxis;
		startLineAtZero;
		width: 1000;
		height: 500;
		models: index.
	^ diag open