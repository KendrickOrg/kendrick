as yet unclassified
testCreateNewPopulationForMultiSpeciesModel
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	aNewPopulation addSubPopulation: ((KECompartment new) status: #S; initialNbIndividuals: 99999).
	aNewPopulation addSubPopulation: ((KECompartment new) status: #I; initialNbIndividuals: 1).
	aNewPopulation addSubPopulation: ((KECompartment new) status: #R; initialNbIndividuals: 0).
	
	self assert: (aNewPopulation subPopulations size) equals: 3.
	self assert: (aNewPopulation subPopulations at: 1) isACompartment equals: true.  
	self assert: (aNewPopulation subPopulations at: 1) superPopulation equals: aNewPopulation.
	self assert: (aNewPopulation subPopulations at: 1) id equals: 1.