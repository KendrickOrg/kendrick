behavior
move
	|ind model popFrom popTo|
	ind := self arguments at: #ind.
	model := self arguments at: #model.
	"move from current population"
	popFrom := model population at: (model getPID).
	(popFrom at: (ind currentStatus)) removeIndividual: 1.
	popFrom removeIndividual: ind.
	popFrom hasGraph ifTrue: [ popFrom graph releaseRoom: (ind) ].
	"move to new population"
	popTo := model population at: (ind nextStatus).
	popTo hasGraph ifTrue: [ popTo graph newRoom: ind ].
	(popTo at: (ind currentStatus)) addIndividual: 1.
	popTo addIndividual: ind.
	^ true