accessing
executeOn: model times: times
	|currentPID subPop|
	currentPID := model currentPopulationID.
	subPop := model population at: currentPID.
	actions keysAndValuesDo: [ :status :value|
		(subPop at: status) addToCompartment: (value * times)
		]