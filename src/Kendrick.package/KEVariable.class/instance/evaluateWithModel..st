as yet unclassified
evaluateWithModel: aModel
|x popIndexList subPop|
	x := aModel temporalParameters at: symbol ifAbsent: [ nil ].
	x ifNil: [ 
		x := aModel atParameter: symbol.
		x ifNil: [ 
			(symbol = #t) ifTrue: [ ^ aModel timeValue ].
			popIndexList := aModel temporalParameters at: #PID ifAbsent: [ nil ].
			popIndexList ifNotNil: [ 
				subPop := aModel population atSubPopulation: popIndexList.
				^ (subPop atSubPopulation: symbol) currentNbIndividuals
				 ].
			^ (aModel population atSubPopulation: symbol) currentNbIndividuals
			 ]
		 ].
	^ x 