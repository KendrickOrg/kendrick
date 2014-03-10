as yet unclassified
plot: aSymbol	
	(data at: 1) size > 1 
	ifTrue: [self plotVector: aSymbol]
	ifFalse: [
		| diag f Ylabel |
		f := [ :x | (self atIndex: x) at: 1 ].
		Ylabel := 'Number of Individuals of ',aSymbol asString.
		diag := GETDiagramBuilder new.
		diag lineDiagram 
			height: 400;
			models: index;
			y: f;
			color: Color blue;
			yAxisLabel: Ylabel;
			xAxisLabel: 'Time';
			withBezierLines: true;
			tension: 2;
			regularAxis.
		^ diag open
		]
	
	