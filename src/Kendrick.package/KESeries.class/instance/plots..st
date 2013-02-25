as yet unclassified
plots: anArrayOfSymbols
"Draw a composite diagram of all compartments in models. This function is only used for classic model with no multi-hosts or multi-strains"
|nbComp listOfColor compDiag |
nbComp := anArrayOfSymbols size.
listOfColor := Array new: nbComp.
1 to: nbComp do: [:i|
	|rd|
	rd := Random new.
	(anArrayOfSymbols at: i) = #S ifTrue: [listOfColor at: i put: (Color red)] 
	ifFalse: [(anArrayOfSymbols at: i) = #I ifTrue:[listOfColor at: i put: (Color blue)] 
		ifFalse: [(anArrayOfSymbols at: i) = #R ifTrue:[listOfColor at: i put: (Color green)] 
			ifFalse: [(anArrayOfSymbols at: i) = #E ifTrue: [listOfColor at: i put: (Color yellow)]
				ifFalse: [listOfColor at: i put: (Color r: (rd next) g: (rd next) b: (rd next))]]]]	
	].
compDiag := ESDiagramRenderer new.
compDiag compositeDiagram.
1 to: nbComp do: [:i|
	|diag|
	diag := (ESDiagramRenderer new lineDiagram)
		y: #second;
		yAxisLabel: 'Number of individuals for each class';
		regularAxis;
		startLineAtZero;
		defaultColor: (listOfColor at: i);
		width: 1000;
		height: 400;
		models: (self atIndex: (anArrayOfSymbols at: i)).
	compDiag diagram add: diag. 	
	].
^compDiag open.
