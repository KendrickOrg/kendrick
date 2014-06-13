as yet unclassified
testCreateNewPopulationWithUnknownSubPopulations
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	self assert: (aNewPopulation parent) equals: nil.
	self assert: (aNewPopulation nodes size) equals: 0.  