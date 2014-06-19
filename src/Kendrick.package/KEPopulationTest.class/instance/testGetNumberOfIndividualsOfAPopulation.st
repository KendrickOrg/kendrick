as yet unclassified
testGetNumberOfIndividualsOfAPopulation
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	aNewPopulation compartments: #((S 99999) (I 1) (R 0)).
	
	self assert: (aNewPopulation getNbIndividuals) equals: 100000.
	