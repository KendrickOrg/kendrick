as yet unclassified
testCreateNewPopulationForSIRModel
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	aNewPopulation compartments: #(S I R).
	aNewPopulation at: #S put: 99999; at: #I put: 1; at: #R put: 0.
	self assert: (aNewPopulation getNbSubPopulations) equals: 3.
	self assert: (aNewPopulation at: #S) isCompartment equals: true.  
	self assert: (aNewPopulation at: #S) status equals: #S
