adding
addIndividual: ind
	(self diedIndList size > 0) 
	ifTrue: [ 
		ind id: (self diedIndList removeFirst).
		self individuals at: (ind id) put: ind
		]
	ifFalse: [  
		ind id: (self individuals size + 1).
		self individuals add: ind
		].
	