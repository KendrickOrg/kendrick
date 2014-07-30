accessing
executeOn: model
	|currentPID subPop|
	currentPID := model currentPopulationID.
	subPop := model population at: currentPID.
	actions keysAndValuesDo: [ :status :value|
		"|old|
		old := (subPop at: status) currentNbIndividuals.
		(subPop at: status) currentNbIndividuals: (old + value)"
		(subPop at: status) addIndividual: value
		]