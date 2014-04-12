as yet unclassified
evaluateWithModel: aModel withTemporalParameters: parameters
	|indexValues x popIndexList subPop|
	indexValues := indexList collect: [ :each| each evaluateWithModel: aModel withTemporalParameters: parameters ].
	x := aModel atParameter: symbol.
	x isNumber ifTrue: [ ^ x ].
	x ifNil: [ 
		popIndexList := parameters at: #PID ifAbsent: [ nil ].
		popIndexList ifNotNil: [ 
			subPop := aModel population atSubPopulation: popIndexList.
			^ ((subPop atSubPopulation: indexValues) atSubPopulation: symbol) currentNbIndividuals
			 ].
		^ ((aModel population atSubPopulation: indexValues) atSubPopulation: symbol) currentNbIndividuals
		 ].
	indexValues do: [ :each| x := (x at: each) ].
	^ x