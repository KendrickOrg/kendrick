instance creation
newNode: ind
	(ind id > nodes size) 
	ifTrue: [ 
		|node| 
		ind position: (self addNode).
		node := self nodes at: (ind id).
		node adjacentNodes do: [ :ajNodeID| 
			node at: ((population indList at: ajNodeID) currentStatus) add: 1]
		].
	(nodes at: (ind id)) adjacentNodes do: [ :i|
		(nodes at: i) at: (ind currentStatus) add: 1
		]

	