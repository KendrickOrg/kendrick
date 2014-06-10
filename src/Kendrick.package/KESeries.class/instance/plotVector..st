as yet unclassified
plotVector: aSymbol
	| cpdiag f Ylabel nbSpecies listColor diagBuilder |	
	cpdiag := GETCompositeDiagram new.
	nbSpecies := (data at: 1) size.
	listColor := self initializeListColors.
	Ylabel := 'Number of Individuals of ',aSymbol asString.
	1 to: nbSpecies do:[:i|
		|diag|
		f := [ :x | (self atIndex: x) at: i ].
		diag := (GETLineDiagram new)
			y: f;
			color: (listColor at: i);
			models: index.
			cpdiag add: diag.
		].
	cpdiag height: 500.
	cpdiag yAxisLabel: Ylabel.
	cpdiag regularAxis.
	diagBuilder := GETDiagramBuilder new.
	diagBuilder diagram: cpdiag.
	^ diagBuilder open