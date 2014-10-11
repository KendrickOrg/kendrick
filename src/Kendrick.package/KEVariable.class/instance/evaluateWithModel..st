as yet unclassified
evaluateWithModel: aModel
|x currentPID subPop|
	x := aModel temporalParameters at: symbol ifAbsent: [ nil ].
	x ifNil: [ 
		x := aModel atParameter: symbol.
		x ifNil: [ 
			(symbol = #t) ifTrue: [ ^ aModel temporalParameters at: #t ].
			currentPID := aModel currentPopulationID.
			subPop := aModel population at: currentPID.
			subPop isPopulation 
			ifTrue: [ 
				^ (subPop at: symbol) currentNbIndividuals ]
			ifFalse: [ ^ subPop nbOfIndividualsOf: symbol ]
			].
		].
	^ x 