as yet unclassified
edges: associations rate: aSymbol values: rValues
	"rValues: values of rate of each edge"
	|array|
	self addEdges: associations.
	rValues isNumber ifTrue: [ array := self edges collect: [ :e| rValues ] ] ifFalse: [ array := rValues ].
	1 to: self edges size do: [ :i| self with: (self edges at: i) weight: aSymbol value: (array at: i) ]
	