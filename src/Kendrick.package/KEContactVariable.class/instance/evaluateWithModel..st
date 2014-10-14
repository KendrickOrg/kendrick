as yet unclassified
evaluateWithModel: model
	|subPopulation individualID x|
	x := model temporalParameters at: symbol ifAbsent: [ nil ].
	x ifNil: [ 
		x := model atParameter: symbol.
		x ifNil: [ 
			"currentPID := model currentPopulationID."
			subPopulation := model currentSubPopulation.
			individualID := model currentIndividual.
			^ (subPopulation graph nodes at: individualID) at: symbol
			 ]
		 ].
	^ x
	