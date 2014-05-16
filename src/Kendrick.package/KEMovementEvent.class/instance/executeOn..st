as yet unclassified
executeOn: model
	|old|
	old := ((model population at: fromStatus) at: compartment) currentNbIndividuals. 
	((model population at: fromStatus) at: compartment) currentNbIndividuals: (old - 1).
	old := ((model population at: toStatus) at: compartment) currentNbIndividuals. 
	((model population at: toStatus) at: compartment) currentNbIndividuals: (old + 1) 