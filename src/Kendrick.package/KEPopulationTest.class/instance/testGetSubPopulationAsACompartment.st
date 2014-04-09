as yet unclassified
testGetSubPopulationAsACompartment
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	aNewPopulation addSubPopulation: ((KECompartment new) status: #S; initialNbIndividuals: 99999).
	aNewPopulation addSubPopulation: ((KECompartment new) status: #I; initialNbIndividuals: 1).
	aNewPopulation addSubPopulation: ((KECompartment new) status: #R; initialNbIndividuals: 0).
	
	self assert: (aNewPopulation subPopulations size) equals: 3.
	self assert: (aNewPopulation getSubPopulationAt: #S) status equals: #S.  
	