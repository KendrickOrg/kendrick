as yet unclassified
plot: aSymbol in: aModel
"Draw a diagram for a compartment of model. 2 cases: compartment is a vector or not"
(aModel atCompartment: aSymbol) isVector ifTrue: [
	"Draw a composite diagram of 3 first elements of the vector"
	|cpDiag diag1 diag2 diag3|	
	diag1 := (ESDiagramRenderer new lineDiagram)	
		y: #second;					
		defaultColor: (Color red);		
		yAxisLabel: 'Number of individuals';		
		regularAxis;		
		startLineAtZero;		
		models: ((result at: aSymbol) at: 1);
		yourself.				
	diag2 := (ESDiagramRenderer new lineDiagram)	
		y: #second;		
		defaultColor: (Color green);			
		models: ((result at: aSymbol) at: 2);
		yourself.
	(result at: aSymbol) size >= 3 ifTrue: [	
	diag3 := (ESDiagramRenderer new lineDiagram)	
		y: #second;					
		defaultColor: (Color blue);				
		models: ((result at: aSymbol) at: 3);
		yourself].
	cpDiag := ESDiagramRenderer new.
	diag3 ifNotNil: [(cpDiag compositeDiagram)
		add: diag1; add: diag2; add: diag3; width: 1200; height: 500; preferredAxisMaxY: 50] 
	ifNil: [(cpDiag compositeDiagram)
		add: diag1; add: diag2; width: 1200; height: 500; preferredAxisMaxY: 50].		
	^ cpDiag open.
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
		models: (result at: aSymbol)	.
	^ diag open.
	]
 