adding
addIndividual: ind
	"ind populationID: (self populationID)."
	(self diedIndList size > 0) 
	ifTrue: [ 
		ind id: (self diedIndList removeFirst).
		ind position: (self indList at: (ind id)) position.
		self indList at: (ind id) put: ind
		]
	ifFalse: [  
		ind id: (self indList size + 1).
		self indList add: ind
		].
	(self at: (ind currentStatus)) addToCompartment: 1