as yet unclassified
evaluateWithModel: aModel
	|indexValues x currentPID subPop|
	indexValues := indexList collect: [ :each| each evaluateWithModel: aModel ].
	indexValues := indexValues collect: [ :each| each < 0 ifTrue: [ 0 ] ifFalse: [ each ] ].
	x := aModel atParameter: symbol.
	x isNumber ifTrue: [ ^ x ].
	x ifNil: [ 
		currentPID := aModel currentPopulationID.
		subPop := aModel population at: currentPID.
		currentPID last = indexValues first 
		ifTrue:  [ 
			|contacts|
			contacts := -1.
			subPop graph ifNotNil: [ contacts := (subPop graph nodes at: (aModel currentIndividual)) at: symbol ].
			contacts = -1 ifTrue: [ ^ (subPop at: symbol) currentNbIndividuals ].
			^ contacts
      		]
		ifFalse: [ ^ ((subPop parent at: (indexValues first)) at: symbol) currentNbIndividuals ].
		].
	indexValues do: [ :each| x := (x at: each) ].
	^ x