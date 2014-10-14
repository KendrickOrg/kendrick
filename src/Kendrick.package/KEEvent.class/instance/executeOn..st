accessing
executeOn: model
	|subPop|
	"currentPID := model currentPopulationID."
	subPop := model currentSubPopulation.
	actions keysAndValuesDo: [ :status :value|
		(subPop at: status) addToCompartment: value
		]