accessing
edges: edgeCollection weight: aSymbol values: weightCollection
	"Simplest DSL that add a collection of sub-population into population"
	"i.e: population nodes: ($a $b $c)"
	(aSymbol = #m | aSymbol = #movement) ifTrue: [ self with: #movement value: true ].
	graph edges: edgeCollection weight: aSymbol values: weightCollection. 
	