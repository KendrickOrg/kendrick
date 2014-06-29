behavior
move
	|ind model popFrom popTo|
	ind := self arguments at: #ind.
	model := self arguments at: #model.
	"move from pcurrent opulation"
	self halt.
	popFrom := model population at: (model getPID).
	popFrom graph hasNetwork ifTrue: [ popFrom graph releaseRoom: (ind id) ].
	(popFrom at: (ind currentStatus)) removeIndividual: 1.
	"move to new population"
	popTo := model population at: (ind nextStatus).
	popTo graph newInd: ind in: (popTo id).
	(popTo at: (ind currentStatus)) addIndividual: 1.
	^ true