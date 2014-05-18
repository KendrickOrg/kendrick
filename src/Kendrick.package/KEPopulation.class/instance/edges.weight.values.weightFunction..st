accessing
edges: edgeCollection weight: aSymbol values: weightCollection weightFunction: aBlock
	"This DSL command is only used for defining the interaction between sub-population of population"
	graph ifNil: [ 
		graph := KEGraph new.
		nodeNames 
		ifNil: [ graph nodes: (nodes size) ]
		ifNotNil: [ graph nodes: (nodeNames) ]
		 ].
	((aSymbol = #m) | (aSymbol = #movement)) ifTrue: [ self addParameter: #movement value: true ].
	aSymbol = #m 
	ifTrue: [ 
		graph edges: edgeCollection weight: #movement values: weightCollection weightFunction: aBlock
		 ]
	ifFalse: [ 
		graph edges: edgeCollection weight: aSymbol values: weightCollection weightFunction: aBlock 
		 ]
	
	
	