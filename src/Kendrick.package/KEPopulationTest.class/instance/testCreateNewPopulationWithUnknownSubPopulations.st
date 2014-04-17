as yet unclassified
testCreateNewPopulationWithUnknownSubPopulations
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	self assert: (aNewPopulation superPopulation) equals: nil.
	self assert: (aNewPopulation subPopulations size) equals: 0.  