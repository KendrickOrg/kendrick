as yet unclassified
executeOn: model times: times
	actions keysAndValuesDo: [ :status :value|
		|subPop|
		subPop := (model population at: status).
		(subPop at: compartment) addToCompartment: (value * times)
		 ]