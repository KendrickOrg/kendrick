as yet unclassified
testGetNumberOfIndividualsOfASubPopulation
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	aNewPopulation compartments: #((S 99999) (I 1) (R 0)).
	
	self assert: (aNewPopulation getNbIndividualsOfCompartment: #S) equals: 99999.
	