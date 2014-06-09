accessing
executeOn: model times: times
	|currentPID subPop|
	currentPID := model getPID.
	subPop := model population at: currentPID.
	actions keysAndValuesDo: [ :status :value|
		|old use|
		old := (subPop at: status) currentNbIndividuals.
		value < 0 
		ifTrue: [ use := (Array with: old with: times) min ]
		ifFalse: [ use := times ].
		(subPop at: status) currentNbIndividuals: (old + (value * use))
		]