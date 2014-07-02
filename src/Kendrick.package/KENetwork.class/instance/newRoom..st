as yet unclassified
newRoom: ind
	self emptyRooms size = 0 
	ifTrue: [ 
		nbInd := nbInd + 1.
		ind id: (nbInd).
		ind location: (self makeNewRoom).
		 ]
	ifFalse: [ 
		|room|
		room := self rndEptRoom.
		ind id: room.
		ind location: (population indList at: room) location.
	].
	self updateContact: ind.
	(nodes at: (ind id)) adjacentNodes do: [ :i|
		(nodes at: i) at: (ind currentStatus) add: 1
		]