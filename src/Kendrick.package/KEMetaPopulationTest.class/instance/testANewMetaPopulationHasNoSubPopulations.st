tests
testANewMetaPopulationHasNoSubPopulations
	|population|
	population := KEMetaPopulation new.
	self assert: population nbOfSubPopulations equals: 0