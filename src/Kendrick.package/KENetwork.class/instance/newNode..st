instance creation
newNode: ind
	(nodes size > 0) ifTrue: [ 
		self emptyNodes size = 0 
		ifTrue: [ 
			ind position: (self addNode).
			ind id: (self nodes size).
			self updateContact: ind.
			 ]
		ifFalse: [ 
			|room|
			room := self rndEmptyNode.
			ind id: room.
			ind position: (population indList at: room) position.
		].
		(nodes at: (ind id)) adjacentNodes do: [ :i|
			(nodes at: i) at: (ind currentStatus) add: 1
			]
		 ]
	