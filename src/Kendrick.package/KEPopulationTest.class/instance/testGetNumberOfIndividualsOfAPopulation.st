as yet unclassified
testGetNumberOfIndividualsOfAPopulation
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	aNewPopulation compartments: #(S I R).
	aNewPopulation at: #S put: 99999; at: #I put: 1; at: #R put: 0.
	
	self assert: (aNewPopulation nbOfIndividuals) equals: 100000.
	