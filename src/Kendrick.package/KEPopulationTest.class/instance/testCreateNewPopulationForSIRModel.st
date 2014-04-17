as yet unclassified
testCreateNewPopulationForSIRModel
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	aNewPopulation addSubPopulation: ((KECompartment new) status: #S; initialNbIndividuals: 99999).
	aNewPopulation addSubPopulation: ((KECompartment new) status: #I; initialNbIndividuals: 1).
	aNewPopulation addSubPopulation: ((KECompartment new) status: #R; initialNbIndividuals: 0).
	
	self assert: (aNewPopulation getNbSubPopulations) equals: 3.
	self assert: (aNewPopulation atSubPopulation: 1) isACompartment equals: true.  
	self assert: (aNewPopulation atSubPopulation: 1) superPopulation equals: aNewPopulation.
	self assert: (aNewPopulation atSubPopulation: 1) id equals: 1.
	self assert: (aNewPopulation atSubPopulation: 1) status equals: #S
