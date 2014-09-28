behavior
birth
	|ind model pop|
	ind := self arguments at: #ind.
	model := self arguments at: #model.
	pop := model population at: (model currentPopulationID).
	"pop hasGraph ifTrue: [" pop graph newNode: ind "]".
	(pop at: ind currentStatus) addToCompartment: 1.
	ind nextStatus: nil.
	pop addIndividual: ind.
	^ true