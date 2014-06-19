as yet unclassified
executeOn: model times: times
	actions keysAndValuesDo: [ :status :value|
		"|subPop old use|
		subPop := (model population at: status).
		old := (subPop at: compartment) currentNbIndividuals.
		value < 0
		ifTrue: [ use := (Array with: old with: times) min ]
		ifFalse: [ use := times ].
		(subPop at: compartment) currentNbIndividuals: (old + (value * use))"
		|subPop|
		subPop := (model population at: status).
		(subPop at: compartment) addIndividual: (value * times)
		 ]