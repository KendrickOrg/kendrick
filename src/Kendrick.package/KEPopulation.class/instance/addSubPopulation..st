accessing
addSubPopulation: anObject
	"This function will add a new subpopulation or a new compartment for the current population"
	anObject id: (subPopulations size + 1).
	anObject superPopulation: self.
	subPopulations addLast: anObject