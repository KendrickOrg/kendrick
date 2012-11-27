as yet unclassified
plot: aSymbol at: index in: aModel
"Draw a diagram for a compartment of model. 2 cases: compartment is a vector or not"
(aModel atCompartment: aSymbol) isVector ifTrue: [
	|diag|
	diag := ESDiagramRenderer new.
		(diag lineDiagram)
		y: #second;					
		defaultColor: (Color blue);		
		yAxisLabel: 'Number of individuals';		
		regularAxis;		
		startLineAtZero;		
		width: 1000;
		height: 500;
		models: ((timeSeries at: aSymbol) at: index)	.
	^ diag open.
	] ifFalse: [
	|diag|
	diag := ESDiagramRenderer new.
		(diag lineDiagram)
		y: #second;					
		defaultColor: (Color blue);		
		yAxisLabel: 'Number of individuals';		
		regularAxis;		
		startLineAtZero;		
		width: 1000;
		height: 500;
		models: (timeSeries at: aSymbol)	.
	^ diag open.
	]
 