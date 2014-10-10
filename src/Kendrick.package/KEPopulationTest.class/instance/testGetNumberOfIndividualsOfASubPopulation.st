as yet unclassified
testGetNumberOfIndividualsOfASubPopulation
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	aNewPopulation compartments: #(S I R).
	aNewPopulation at: #S put: 99999; at: #I put: 1; at: #R put: 0.
	
	self assert: (aNewPopulation getNbIndividualsOfCompartment: #S) equals: 99999.
	