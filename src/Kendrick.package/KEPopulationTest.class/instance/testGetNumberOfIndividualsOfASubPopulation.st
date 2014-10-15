tests
testGetNumberOfIndividualsOfASubPopulation
	self assert: (anSIRPopulationWith1000Individuals nbOfIndividualsOf: #S) equals: 99999
	