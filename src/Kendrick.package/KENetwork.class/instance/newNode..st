instance creation
newNode: ind
	"just called in the case of network between individuals"
	networkOfIndividuals ifTrue: [ 
		(ind id > nodes size) 
		ifTrue: [ 
			|node| 
			(self addNode: ind).
			node := self nodes at: (ind id).
			node adjacentNodes keysDo: [ :ajNodeID| 
				node atContact: ((population individuals at: ajNodeID) currentStatus at: #status) add: 1]
		].
		(nodes at: (ind id)) adjacentNodes keysDo: [ :i|
			(nodes at: i) atContact: (ind currentStatus at: #status) add: 1
		]
	]
	

	