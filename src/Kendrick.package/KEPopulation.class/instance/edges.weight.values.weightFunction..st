accessing
edges: edgeCollection weight: aSymbol values: weightCollection weightFunction: aBlock
	"This DSL command is only used for defining the interaction between sub-population of population"
	(aSymbol = #m | aSymbol = #movement) ifTrue: [ self with: #movement value: true ].
	graph edges: edgeCollection weight: aSymbol values: weightCollection weightFunction: aBlock
	
	