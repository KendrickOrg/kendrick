accessing
initialize
	super initialize.
	self subPopulations: (OrderedCollection new).
	self superPopulation: nil.
	self id: 0