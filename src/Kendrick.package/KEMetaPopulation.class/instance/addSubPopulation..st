adding
addSubPopulation: aPopulation
	|popID|
	"popID := self populationID copy.
	popID add: (subPopulations size + 1)."
	popID := (subPopulations size + 1).
	aPopulation populationID: popID.
	aPopulation parent: self.
	subPopulations add: aPopulation