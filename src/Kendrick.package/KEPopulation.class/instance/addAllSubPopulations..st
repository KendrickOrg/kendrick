accessing
addAllSubPopulations: anArray
	anArray do: [ :each|
		self addSubPopulation: each ]
	