as yet unclassified
testCreateNewPopulationWithUnknownSubPopulations
	|aNewPopulation|
	aNewPopulation := KEMetaPopulation new.
	self assert: (aNewPopulation parent) equals: nil.
	self assert: (aNewPopulation getNbSubPopulations) equals: 0.  