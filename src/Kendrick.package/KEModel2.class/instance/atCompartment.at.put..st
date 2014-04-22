as yet unclassified
atCompartment: aSymbol at: anIndex put: aNumber
	(compartmentAsVector at: anIndex) initialNbIndividuals: aNumber; currentNbIndividuals: aNumber
	