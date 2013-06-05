as yet unclassified
plot: aSymbol	
	(data at: 1) size > 1 
	ifTrue: [self plotVector: aSymbol]
	ifFalse: [
		| diag f Ylabel |
		f := [ :x | (self atIndex: x) at: 1 ].
		Ylabel := 'Number of Individuals of ',aSymbol asString.
		diag := ESDiagramRenderer new.
		diag lineDiagram
			y: f;
			defaultColor: Color blue;
			yAxisLabel: Ylabel;
			regularAxis;
			startLineAtZero;
			width: 1000;
			height: 500;
			models: index.
		^ diag open
		]
	