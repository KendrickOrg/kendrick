accessing
nodes: aCollection edges: edgeCollection weight: aSymbol values: weightCollection
	"Simplest DSL that add a collection of sub-population into population"
	"i.e: population nodes: ($a $b $c)"
	self nodes: aCollection.
	graph ifNil: [ graph := KEGraph new ].
	graph nodes: aCollection.
	graph edges: edgeCollection.
	graph weight: aSymbol values: weightCollection. 
	