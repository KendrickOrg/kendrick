as yet unclassified
evaluateWithModel: aModel
	|indexValues x subPop|
	indexValues := indexList collect: [ :each| each evaluateWithModel: aModel ].
	indexValues := indexValues collect: [ :each| each < 0 ifTrue: [ 0 ] ifFalse: [ each ] ].
	x := aModel atParameter: symbol.
	x isNumber ifTrue: [ ^ x ].
	x ifNil: [ 
		"currentPID := aModel currentPopulationID."
		subPop := aModel currentSubPopulation.
		subPop populationID = indexValues first 
		ifTrue: [ 
		 	^ (subPop at: symbol) currentNbIndividuals
			]
		ifFalse: [ ^ ((subPop parent at: (indexValues first)) at: symbol) currentNbIndividuals ].
		].
	indexValues do: [ :each| x := (x at: each) ].
	^ x