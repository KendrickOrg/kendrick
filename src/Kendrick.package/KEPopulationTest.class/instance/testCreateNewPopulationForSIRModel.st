as yet unclassified
testCreateNewPopulationForSIRModel
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	aNewPopulation compartments: #((S 99999) (I 1) (R 0)).
	self assert: (aNewPopulation getNbSubPopulations) equals: 3.
	self assert: (aNewPopulation at: 1) isACompartment equals: true.  
	self assert: (aNewPopulation at: 1) parent equals: aNewPopulation.
	self assert: (aNewPopulation at: 1) id asArray equals: #(0 1).
	self assert: (aNewPopulation at: 1) status equals: #S
