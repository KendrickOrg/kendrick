accessing
plot: anObject
	"|builder diag|
	builder := GETDiagramBuilder new.
	diag := builder compositeDiagram.
	anObject isArray 
		ifFalse: [ diag add: (self createLineDiagram: anObject) ] 
		ifTrue: [ 1 to: (anObject size) do: [ :i| diag add: (self createLineDiagram: an) ] ]"