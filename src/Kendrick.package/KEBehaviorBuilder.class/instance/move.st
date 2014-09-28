behavior
move
	|ind model popFrom popTo|
	ind := self arguments at: #ind.
	model := self arguments at: #model.
	"move from current population"
	popFrom := model population at: (model currentPopulationID).
	(popFrom at: (ind currentStatus)) removeFromCompartment: 1.
	popFrom removeIndividual: ind.
	"popFrom hasGraph ifTrue: [ "popFrom graph releaseNode: (ind) "]".
	"move to new population"
	popTo := model population at: (ind nextStatus).
	"popTo hasGraph ifTrue: [" popTo graph newNode: ind "]".
	(popTo at: (ind currentStatus)) addToCompartment: 1.
	popTo addIndividual: ind.
	^ true