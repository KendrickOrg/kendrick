as yet unclassified
evaluateWithModel: model
	|currentPID subPopulation individualID|
	currentPID := model currentPopulationID.
	subPopulation := model population at: currentPID.
	individualID := model currentIndividual.
	^ (subPopulation graph nodes at: individualID) at: symbol