as yet unclassified
evaluateWithModel: aModel
|x currentPID subPop|
	x := aModel temporalParameters at: symbol ifAbsent: [ nil ].
	x ifNil: [ 
		x := aModel atParameter: symbol.
		x ifNil: [ 
			(symbol = #t) ifTrue: [ ^ aModel temporalParameters at: #t ].
			currentPID := aModel getPID.
			subPop := aModel population at: currentPID.
			subPop isAPopulationOfCompartments 
			ifTrue: [ 
				|mode|
				mode := (aModel atParameter: #mode).
				(mode = 'IBM') 
				ifTrue: [ ^ (subPop graph nodes at: (aModel temporalParameters at: #ind )) at: symbol ].
				^ (subPop at: symbol) currentNbIndividuals ]
			ifFalse: [ ^ subPop getNbIndividualsOfCompartment: symbol ]
			].
		].
	^ x 