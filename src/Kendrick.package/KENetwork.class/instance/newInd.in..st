as yet unclassified
newInd: ind in: pid
	ind attributes at: #pid put: pid.
	self emptyRooms size = 0 
	ifTrue: [ 
		indList add: ind.
		ind attributes at: #id put: (indList size + 1).
		self makeNewRoom.
		 ]
	ifFalse: [ 
		|room|
		room := self rndEptRoom.
		ind attributes at: #id put: room.
		indList at: room put: ind
		 ].
	self updateContact: ind.
	(nodes at: (ind attributes at: #id)) adjacentNodes do: [ :i|
		(nodes at: i) at: (ind attributes at: #currentStatus) add: 1
		 ]