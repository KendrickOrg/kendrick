accessing
nodes: aCollection edges: edgeCollection weight: aSymbol values: weightCollection
	"Simplest DSL that add a collection of sub-population into population"
	"i.e: population nodes: ($a $b $c)"
	self nodes: aCollection.
	(aSymbol = #m | aSymbol = #movement) ifTrue: [ self with: #movement value: true ].
	graph ifNil: [ graph := KEGraph new ].
	graph nodes: aCollection.
	graph edges: edgeCollection weight: aSymbol values: weightCollection. 
	