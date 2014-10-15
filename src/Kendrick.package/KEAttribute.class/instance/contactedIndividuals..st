accessing
contactedIndividuals: model
	|contacts currentInd currentPop|
	contacts := OrderedCollection new.
	currentInd := model currentIndividual.
	currentPop := model currentSubPopulation.
	currentPop graph 
	ifNil: [ 
		contacts := currentPop individuals collect: [ :each| 
			each currentStatus = clinicStatus ifTrue: [ each id ] ]
		 ]
	ifNotNil: [ 
		contacts := (currentPop graph nodes at: (currentInd)) adjacentNodes collect: [ :each| (currentPop individuals at: each) currentStatus = clinicStatus ifTrue: [ each ] ]
		 ].
	^ contacts