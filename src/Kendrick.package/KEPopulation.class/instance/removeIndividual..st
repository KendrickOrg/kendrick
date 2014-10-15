adding
removeIndividual: ind
	ind attributes at: #alive put: false.
	self diedIndList add: (ind id).
	self individuals at: (ind id) put: ind.
	(self at: (ind currentStatus)) removeFromCompartment: 1