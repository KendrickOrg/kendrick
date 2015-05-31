as yet unclassified
addEdges: edgeCollection
	"edgeCollection is either #all or an array of associations: {#a->#b. #a->#c. ...}"
	edgeCollection = #all
	ifTrue: [ 
		1 to: self nodes size do: [ :i|
			(i + 1) to: self nodes size do: [ :j| 
				self edges add: (Array with: (self nodes at: i) label with: (self nodes at: j) label)
			]
		]	
	]
	ifFalse: [ edgeCollection do: [ :e| self addEdge: e ] ]