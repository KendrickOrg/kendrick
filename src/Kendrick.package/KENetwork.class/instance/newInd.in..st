as yet unclassified
newInd: ind in: pid
	ind pid: pid.
	self emptyRooms size = 0 
	ifTrue: [ 
		indList add: ind.
		ind id: (indList size).
		self makeNewRoom.
		 ]
	ifFalse: [ 
		|room|
		room := self rndEptRoom.
		ind id: room.
		indList at: room put: ind
		 ].
	self updateContact: ind.
	(nodes at: (ind attributes at: #id)) adjacentNodes do: [ :i|
		(nodes at: i) at: (ind attributes at: #currentStatus) add: 1
		 ]