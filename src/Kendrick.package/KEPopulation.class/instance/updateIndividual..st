adding
updateIndividual: ind
	|oldStt newStt|
	oldStt := ind currentStatus.
	newStt := ind nextStatus.
	ind nextStatus: nil.
	ind currentStatus: newStt.
	self individuals at: (ind id) put: ind.
	(self at: oldStt) removeFromCompartment: 1.
	(self at: newStt) addToCompartment: 1