as yet unclassified
exampleOfSimplePopulation
	|population|
	population := KEPopulation new.
	population addSubPopulation: (KECompartment status: #S initialNumberOfIndividuals: 1000).
	population addSubPopulation: (KECompartment status: #I initialNumberOfIndividuals: 1).
	population addSubPopulation: (KECompartment status: #R initialNumberOfIndividuals: 0).
	
	^ population