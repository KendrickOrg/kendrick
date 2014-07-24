instance creation
newNode: ind
	self emptyNodes size = 0 
	ifTrue: [ 
		"nbInd := nbInd + 1.
		ind id: (nbInd)."
		ind location: (self addNode).
		ind id: (self nodes size)
		 ]
	ifFalse: [ 
		|room|
		room := self rndEmptyNode.
		ind id: room.
		ind location: (population indList at: room) location.
	].
	self updateContact: ind.
	(nodes at: (ind id)) adjacentNodes do: [ :i|
		(nodes at: i) at: (ind currentStatus) add: 1
		]