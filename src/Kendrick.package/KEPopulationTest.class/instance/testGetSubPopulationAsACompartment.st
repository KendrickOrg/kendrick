as yet unclassified
testGetSubPopulationAsACompartment
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	aNewPopulation compartments: #((S 99999) (I 1) (R 0)).
	
	self assert: (aNewPopulation nodes size) equals: 3.
	self assert: (aNewPopulation at: #S) status equals: #S.  
	