as yet unclassified
atCompartment: aSymbol at: anIndex put: aNumber
	((compartments at: aSymbol) at: anIndex) initialNbIndividuals: aNumber; currentNbIndividuals: aNumber
	