tests
testTheNumberOfSubPopulations
	self assert: (anSIRPopulationWith1000Individuals nbOfSubPopulations) equals: 3
