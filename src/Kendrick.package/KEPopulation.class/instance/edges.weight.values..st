accessing
edges: edgeCollection weight: aSymbol values: weightCollection
	"Simplest DSL that add a collection of sub-population into population"
	"i.e: population nodes: ($a $b $c)"
	graph ifNil: [ 
		graph := KEGraph new.
		nodeNames size = 0
		ifTrue: [ graph nodes: (nodes size) ]
		ifFalse: [ graph nodes: (nodeNames) ]
		 ].
	((aSymbol = #m) | (aSymbol = #movement)) ifTrue: [ self addParameter: #movement value: true ].
	aSymbol = #m 
	ifTrue: [ 
		graph edges: edgeCollection weight: #movement values: weightCollection. 
		 ]
	ifFalse: [ 
		graph edges: edgeCollection weight: aSymbol values: weightCollection. 
		 ]
	
	