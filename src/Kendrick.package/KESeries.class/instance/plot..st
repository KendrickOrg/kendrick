as yet unclassified
plot: aSymbol	
	(data at: 1) isArray 
	ifTrue: [self plotVector: aSymbol]
	ifFalse: [
		| diag f Ylabel |
		f := [ :x | self atIndex: x ].
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
	