adding
addIndividual: ind
	"ind populationID: (self populationID)."
	(self diedIndList size > 0) 
	ifTrue: [ 
		ind id: (self diedIndList removeFirst).
		ind position: (self individuals at: (ind id)) position.
		self individuals at: (ind id) put: ind
		]
	ifFalse: [  
		ind id: (self individuals size + 1).
		self individuals add: ind
		].
	(self at: (ind currentStatus)) addToCompartment: 1