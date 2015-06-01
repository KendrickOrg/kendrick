as yet unclassified
addEdges: edgeCollection
	"edgeCollection is either #all or an array of associations: {#a->#b. #a->#c. ...}"
	((edgeCollection = #all) or: [ edgeCollection = #allIncludingWithItself ])
	ifTrue: [ 
		1 to: self nodes size do: [ :i|
			(i + 1) to: self nodes size do: [ :j| 
				self edges add: (Array with: (self nodes at: i) label with: (self nodes at: j) label)
			]
		].
		(edgeCollection = #allIncludingWithItself) ifTrue: [  
			1 to: self nodes size do: [ :i| self edges add: (Array with: (self nodes at: i) label with: (self nodes at: i) label) ]
		]	
	]
	ifFalse: [ edgeCollection do: [ :e| 
			(e key isSymbol and: [ e value isSymbol ]) 
			ifTrue: [ self edges add: (Array with: {attribute->e key} with: {attribute->e value}) ]
			ifFalse: [ self edges add: (Array with: e key with: e value) ]
			 ] ]