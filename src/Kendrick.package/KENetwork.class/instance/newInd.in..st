as yet unclassified
newInd: ind in: pid
	ind pid: pid.
	self emptyRooms size = 0 
	ifTrue: [ 
		indList add: ind.
		ind id: (indList size).
		nbInd := (indList size).
		self hasNetwork ifTrue: [ self makeNewRoom ].
		 ]
	ifFalse: [ 
		|room|
		room := self rndEptRoom.
		ind id: room.
		ind location: (indList at: room) location.
		indList at: room put: ind
	].
	self hasNetwork ifTrue: [ 
		self updateContact: ind.
		(nodes at: (ind id)) adjacentNodes do: [ :i|
			(nodes at: i) at: (ind currentStatus) add: 1
		]
	]