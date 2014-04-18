as yet unclassified
evaluateWithModel: aModel
|x currentPID subPop|
	x := aModel temporalParameters at: symbol ifAbsent: [ nil ].
	x ifNil: [ 
		x := aModel atParameter: symbol.
		x ifNil: [ 
			(symbol = #t) ifTrue: [ ^ aModel temporalParameters at: #t ].
			currentPID := aModel temporalParameters at: #PID. 
			subPop := aModel population atSubPopulation: currentPID.
			^ (subPop atSubPopulation: symbol) currentNbIndividuals
			].
		].
	^ x 