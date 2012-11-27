as yet unclassified
plot: aSymbol at: index in: aModel do: aFunction
"Draw a diagram for a compartment of model. 2 cases: compartment is a vector or not"
|rs|
aFunction = #sqrt ifTrue: [rs:=self sqrt: aSymbol in: aModel].
aFunction = #log ifTrue: [rs:=self log: aSymbol in: aModel].
aFunction ifNil: [rs:=timeSeries at: aSymbol].
(aModel atCompartment: aSymbol) isVector ifTrue: [
	"Draw a composite diagram of 3 first elements of the vector"
	|diag|
	diag := ESDiagramRenderer new.
	(diag lineDiagram)
		y: #second;					
		defaultColor: (Color blue);		
		yAxisLabel: 'Number of individuals';		
		regularAxis;		
		startLineAtZero;		
		width: 800;
		height: 300;
		models: (rs at: index).
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
		width: 800;
		height: 300;
		models: rs.
	^ diag open.
	]
 