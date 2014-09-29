behavior
die
	|ind model pop|
	ind := self arguments at: #ind.
	model := self arguments at: #model.
	pop := model population at: (model currentPopulationID).
	pop removeIndividual: ind.
