behavior
move
	|ind model popFrom popTo|
	ind := self arguments at: #ind.
	model := self arguments at: #model.
	"move from current population"
	popFrom := model population at: (model currentPopulationID).
	popTo := model population at: (ind nextStatus).
	popFrom removeIndividual: ind copy.
	popTo addIndividual: ind copy.
