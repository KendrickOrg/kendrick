as yet unclassified
testCreateNewPopulationWithUnknownSubPopulations
	|aNewPopulation|
	aNewPopulation := KEMetaPopulation new.
	self assert: (aNewPopulation parent) equals: nil.
	self assert: (aNewPopulation nbOfSubPopulations) equals: 0.  