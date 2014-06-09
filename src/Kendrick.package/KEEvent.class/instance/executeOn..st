accessing
executeOn: model
	|currentPID subPop|
	currentPID := model getPID.
	subPop := model population at: currentPID.
	actions keysAndValuesDo: [ :status :value|
		|old|
		old := (subPop at: status) currentNbIndividuals.
		(subPop at: status) currentNbIndividuals: (old + value)
		]