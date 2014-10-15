tests
testGetNumberOfIndividualsOfAPopulation
	self assert: (anSIRPopulationWith1000Individuals  nbOfIndividuals) equals: 100000.
	