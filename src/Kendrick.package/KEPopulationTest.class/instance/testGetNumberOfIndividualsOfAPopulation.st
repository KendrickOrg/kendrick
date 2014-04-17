as yet unclassified
testGetNumberOfIndividualsOfAPopulation
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	aNewPopulation addSubPopulation: (KECompartment status: #S initialNumberOfIndividuals: 99999).
	aNewPopulation addSubPopulation: (KECompartment status: #I initialNumberOfIndividuals: 1).
	aNewPopulation addSubPopulation: (KECompartment status: #R initialNumberOfIndividuals: 0).
	
	self assert: (aNewPopulation getNbIndividuals) equals: 100000.
	