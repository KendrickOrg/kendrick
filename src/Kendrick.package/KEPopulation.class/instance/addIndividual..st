adding
addIndividual: ind
	(self diedIndList isEmpty) 
	ifFalse: [ 
		ind id: (self diedIndList removeFirst).
		self individuals at: (ind id) put: ind
		]
	ifTrue: [  
		ind id: (self individuals size + 1).
		self individuals add: ind
		].
	