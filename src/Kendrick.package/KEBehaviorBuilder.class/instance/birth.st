behavior
birth
	|ind model pop|
	ind := self arguments at: #ind.
	model := self arguments at: #model.
	pop := model population at: (model getPID).
	pop hasGraph ifTrue: [ pop graph newRoom: ind ].
	(pop at: ind currentStatus) addIndividual: 1.
	ind nextStatus: nil.
	pop addIndividual: ind.
	^ true