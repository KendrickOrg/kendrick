as yet unclassified
plotVector2: aSymbol
	| cqdiag f Ylabel nbSpecies listColor diagRenderer |	
	cqdiag := ESCompositeDiagram new.
	nbSpecies := (data at: 1) size.
	listColor := self initializeListColors.
	Ylabel := 'Number of Individuals of ',aSymbol asString.
	1 to: nbSpecies do:[:i|
		|diag|
		f := [ :x | (self atIndex: x) at: i ].
		diag := (ESDiagramRenderer new lineDiagram)
			y: f;
			defaultColor: (listColor at: i);
			yAxisLabel: Ylabel;
			regularAxis;
			startLineAtZero;			
			models: index.
			cqdiag add: diag.
		].
	cqdiag width: 1200.
	cqdiag height: 500.
	cqdiag preferredAxisMaxY: (self preferredDataMax).
	diagRenderer := ESDiagramRenderer new.
	diagRenderer diagram: cqdiag.
	^ diagRenderer open