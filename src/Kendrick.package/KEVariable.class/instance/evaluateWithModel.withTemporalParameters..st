as yet unclassified
evaluateWithModel: aModel withTemporalParameters: parameters
	|x popIndexList subPop|
	x := parameters at: symbol ifAbsent: [ nil ].
	x ifNil: [ 
		x := aModel atParameter: symbol.
		x ifNil: [ 
			(symbol = #t) ifTrue: [ ^ aModel timeValue ].
			popIndexList := parameters at: #PID ifAbsent: [ nil ].
			popIndexList ifNotNil: [ 
				subPop := aModel population atSubPopulation: popIndexList.
				^ (subPop atSubPopulation: symbol) currentNbIndividuals
				 ].
			^ (aModel population atSubPopulation: symbol) currentNbIndividuals
			 ]
		 ].
	^ x 
